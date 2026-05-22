import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';

/// Assumed duration for Standard bookings that have no endTime.
const int kAssumedStandardDurationMin = 90;

/// Booking statuses that do NOT block a table.
const Set<String> kNonBlockingStatuses = {
  'cancelled',
  'completed',
  'no_show',
};

/// Parses "HH:mm" → total minutes from midnight.
/// Returns null if the string is malformed.
int? hhmmToMin(String hhmm) {
  final parts = hhmm.split(':');
  if (parts.length < 2) return null;
  final h = int.tryParse(parts[0]);
  final m = int.tryParse(parts[1]);
  if (h == null || m == null) return null;
  return h * 60 + m;
}

/// Half-open interval overlap: [a, b) ∩ [x, y) ≠ ∅ iff a < y && x < b.
/// Back-to-back (a==y or b==x) is NOT a conflict.
bool _overlaps(int a, int b, int x, int y) => a < y && x < b;

/// Private: int minutes → "HH:mm"
String _minToHhmm(int totalMin) {
  final h = totalMin ~/ 60;
  final m = totalMin % 60;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}

/// Returns the set of tableIds that are booked and overlap
/// [startMin, endMin) on [date] (format: "yyyy-MM-dd").
///
/// Pass [excludeBookingId] when editing an existing booking
/// so the booking under edit does not block its own table.
Set<String> busyTableIds({
  required List<BookingEntity> bookings,
  required String date,
  required int startMin,
  required int endMin,
  String? excludeBookingId,
}) {
  final busy = <String>{};
  for (final b in bookings) {
    if (kNonBlockingStatuses.contains(b.status)) continue;
    final tableId = b.tableInfo?.id;
    if (tableId == null) continue;
    if (excludeBookingId != null && b.id == excludeBookingId) continue;
    final parsedDate = DateTime.tryParse(b.date)?.toLocal();
    if (parsedDate == null) continue;
    final bookingDateStr =
        '${parsedDate.year}-'
        '${parsedDate.month.toString().padLeft(2, '0')}-'
        '${parsedDate.day.toString().padLeft(2, '0')}';
    if (bookingDateStr != date) continue;
    final bStart = hhmmToMin(b.timeSlot);
    if (bStart == null) continue;
    final rawEnd = b.endTime != null ? hhmmToMin(b.endTime!) : null;
    final bEnd = rawEnd ?? (bStart + kAssumedStandardDurationMin);
    if (bEnd <= bStart) continue;
    if (_overlaps(startMin, endMin, bStart, bEnd)) {
      busy.add(tableId);
    }
  }
  return busy;
}

/// Returns the conflicting booking's time window string
/// ("HH:mm–HH:mm") for a given tableId, or null if no conflict.
/// Used to show "Band: 18:00–20:00" labels in the UI.
String? conflictWindowFor({
  required List<BookingEntity> bookings,
  required String tableId,
  required String date,
  required int startMin,
  required int endMin,
  String? excludeBookingId,
}) {
  for (final b in bookings) {
    if (kNonBlockingStatuses.contains(b.status)) continue;
    if (b.tableInfo?.id != tableId) continue;
    if (excludeBookingId != null && b.id == excludeBookingId) continue;
    final parsedDate = DateTime.tryParse(b.date)?.toLocal();
    if (parsedDate == null) continue;
    final bookingDateStr =
        '${parsedDate.year}-'
        '${parsedDate.month.toString().padLeft(2, '0')}-'
        '${parsedDate.day.toString().padLeft(2, '0')}';
    if (bookingDateStr != date) continue;
    final bStart = hhmmToMin(b.timeSlot);
    if (bStart == null) continue;
    final rawEnd = b.endTime != null ? hhmmToMin(b.endTime!) : null;
    final bEnd = rawEnd ?? (bStart + kAssumedStandardDurationMin);
    if (bEnd <= bStart) continue;
    if (_overlaps(startMin, endMin, bStart, bEnd)) {
      final endStr = b.endTime ?? _minToHhmm(bEnd);
      return '${b.timeSlot}–$endStr';
    }
  }
  return null;
}
