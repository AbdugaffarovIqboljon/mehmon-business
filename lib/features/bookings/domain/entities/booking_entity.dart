import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_entity.freezed.dart';

enum BookingType { standard, banket }

/// Minutes before a booking's start during which it is already considered to
/// be holding its table (mirrors `kReservedWindowMin` on the floor canvas).
const int kBookingHoldWindowMin = 20;

/// Parses "HH:mm" → minutes from midnight, or null when malformed.
int? _hhmmToMin(String hhmm) {
  final parts = hhmm.split(':');
  if (parts.length < 2) return null;
  final h = int.tryParse(parts[0].trim());
  final m = int.tryParse(parts[1].trim());
  if (h == null || m == null) return null;
  return h * 60 + m;
}

extension BookingEntityX on BookingEntity {
  /// Parsed from `date` ("YYYY-MM-DD") + `timeSlot` ("HH:mm").
  DateTime get dateTime {
    final d = DateTime.tryParse(date) ?? DateTime.now();
    final parts = timeSlot.split(':');
    final hour = parts.isNotEmpty ? int.tryParse(parts[0].trim()) ?? 0 : 0;
    final minute = parts.length > 1 ? int.tryParse(parts[1].trim()) ?? 0 : 0;
    return DateTime(d.year, d.month, d.day, hour, minute);
  } 

  int get partySize => numberOfGuests;

  /// True when this booking is the current holder of its table at [now]:
  /// it falls on today's local calendar day AND `now`'s minute-of-day is in
  /// `[startMin − kBookingHoldWindowMin, endMin)`. `endMin` falls back to
  /// `startMin + 120` when `endTime` is absent — the same convention the floor
  /// auto-derivation uses. Domain gate for releasing a table when a booking is
  /// finalized; a future or past booking returns false so its termination can
  /// never clear a different current occupancy on the same table.
  bool isHoldingTableAt(DateTime now) {
    final parsedDate = DateTime.tryParse(date)?.toLocal();
    if (parsedDate == null) return false;
    final bookingDay =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
    final today = DateTime(now.year, now.month, now.day);
    if (bookingDay != today) return false;

    final startMin = _hhmmToMin(timeSlot);
    if (startMin == null) return false;
    final endMin = (endTime != null ? _hhmmToMin(endTime!) : null) ??
        startMin + 120;
    if (endMin <= startMin) return false;

    final refMin = now.hour * 60 + now.minute;
    return refMin >= startMin - kBookingHoldWindowMin && refMin < endMin;
  }

  /// True when this booking's `endTime` (combined with its `date`) lies strictly
  /// in the past. Combining date + endTime into a full [DateTime] keeps the
  /// comparison correct across midnight and day boundaries. Returns false when
  /// `endTime` is absent or either field is malformed — an open-ended booking
  /// never auto-expires. Domain gate for booking auto-completion.
  bool get isExpired {
    if (endTime == null) return false;
    final endMin = _hhmmToMin(endTime!);
    if (endMin == null) return false;
    final dateParts = date.split('-');
    if (dateParts.length != 3) return false;
    final year = int.tryParse(dateParts[0]);
    final month = int.tryParse(dateParts[1]);
    final day = int.tryParse(dateParts[2]);
    if (year == null || month == null || day == null) return false;
    final endDt = DateTime(year, month, day, endMin ~/ 60, endMin % 60);
    return endDt.isBefore(DateTime.now());
  }

  /// Full [DateTime] of this booking's `endTime` combined with its `date`, or
  /// null when `endTime` is absent or either field is malformed. Mirrors the
  /// parsing pattern used by [isExpired] and reuses `_hhmmToMin`.
  DateTime? get endDateTime {
    if (endTime == null) return null;
    final endMin = _hhmmToMin(endTime!);
    if (endMin == null) return null;
    final parts = date.split('-');
    if (parts.length != 3) return null;
    final y = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    final d = int.tryParse(parts[2]);
    if (y == null || m == null || d == null) return null;
    return DateTime(y, m, d, endMin ~/ 60, endMin % 60);
  }

  /// Sort bucket for day-view ordering — pure/computed, no side effects:
  /// `0` ongoing (started, not yet ended), `1` upcoming (starts in the future),
  /// `2` past/finalized (completed, cancelled, or already ended).
  int get sortBucket {
    final now = DateTime.now();
    final start = dateTime;
    final end = endDateTime;

    // Terminal statuses → always past bucket.
    if (status == 'completed' || status == 'cancelled') return 2;

    // PAST: start already passed.
    if (start.isBefore(now)) {
      // Has endTime and it hasn't passed yet → genuinely ongoing.
      if (end != null && end.isAfter(now)) return 0;
      // No endTime: open-ended booking → ongoing only within a start+2h grace
      // window (matches isHoldingTableAt's start+120min fallback), then past.
      if (end == null) {
        final grace = start.add(const Duration(hours: 2));
        if (grace.isAfter(now)) return 0; // still within 2h grace → ongoing
        return 2; // past grace window → past
      }
      return 2; // endTime exists and has passed
    }

    // UPCOMING: starts in the future.
    return 1;
  }
}

@freezed
abstract class TableInfoEntity with _$TableInfoEntity {
  const factory TableInfoEntity({
    required String id,
    required String number,
    required int capacity,
  }) = _TableInfoEntity;
}

@freezed
abstract class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String guestName,
    required String phone,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    required String createdAt,
    TableInfoEntity? tableInfo,
    String? endTime,
    BookingType? bookingType,
    String? notes,
  }) = _BookingEntity;
}
