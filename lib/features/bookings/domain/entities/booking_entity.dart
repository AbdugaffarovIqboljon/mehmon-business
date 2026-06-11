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
