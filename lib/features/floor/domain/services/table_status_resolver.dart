import 'package:flutter/material.dart' show TimeOfDay;

import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';

// ── Status constants & pure helpers (no closures, no UI) ────────────────────

/// Minutes before a booking's start during which the table reads 'reserved'.
const int kReservedWindowMin = 20;

/// Table statuses that represent a deliberate manual override (set by staff)
/// and therefore win over auto-projection in live mode.
const Set<String> kManualStatuses = {'guest_arrived', 'occupied'};

/// Booking lifecycle statuses that occupy the table on the timeline. Anything
/// else (completed, cancelled, no_show, …) is excluded from the projection.
const Set<String> _kActiveBookingStatuses = {'confirmed', 'arrived'};

/// Single source of truth for a table's *effective* status.
///
/// Both the floor canvas and the table-detail sheet derive their colour/banner
/// from this so the displayed status can never disagree. Reserved/waiting are
/// never persisted on the entity — they are projected from today's bookings —
/// so consumers must call this rather than reading [FloorEntity.status] raw.
class TableStatusResolver {
  const TableStatusResolver._();

  /// Resolves the status shown to the user.
  ///
  /// - [selectedTime] non-null → SCRUB: pure auto-projection at that time.
  ///   Manual overrides are deliberately ignored so the timeline reflects
  ///   bookings only.
  /// - [selectedTime] null → LIVE: a manual override
  ///   ([kManualStatuses]) wins; otherwise derive at [now].
  ///
  /// [now] supplies both the calendar day used to match today's bookings and
  /// (in live mode) the reference minute.
  static String effectiveStatus(
    FloorEntity table,
    List<BookingEntity> bookings, {
    required DateTime now,
    TimeOfDay? selectedTime,
  }) {
    // SCRUB: pure auto-projection at the scrubbed time. Manual overrides are
    // deliberately ignored here so the timeline reflects bookings only.
    if (selectedTime != null) {
      return _computeStatusAtTime(
        tableId: table.id,
        bookings: bookings,
        time: selectedTime,
        now: now,
      );
    }

    // LIVE: a manual override wins; otherwise derive at the current minute.
    if (kManualStatuses.contains(_normalizeStatus(table.status))) {
      return table.status;
    }
    return _computeStatusAtTime(
      tableId: table.id,
      bookings: bookings,
      time: TimeOfDay(hour: now.hour, minute: now.minute),
      now: now,
    );
  }
}

/// Defensive mapping so unknown/legacy backend strings never fall through to
/// the disabled/grey colour in the manual branch: legacy 'available' is
/// treated as 'free', and only [kManualStatuses] count as manual — everything
/// else is derivable (→ auto-projection).
String _normalizeStatus(String? status) {
  if (status == null || status == 'available') return 'free';
  return status;
}

String _computeStatusAtTime({
  required String tableId,
  required List<BookingEntity> bookings,
  required TimeOfDay time,
  required DateTime now,
}) {
  final refMin = time.hour * 60 + time.minute;
  final today = DateTime(now.year, now.month, now.day);

  var hasReservedSoon = false;
  for (final b in bookings) {
    // Candidate filter: table match (tableId null → skip), displayed calendar
    // day, and an ACTIVE booking status.
    if (b.tableInfo?.id != tableId) continue;
    if (!_kActiveBookingStatuses.contains(b.status)) continue;

    // `date` may arrive as a local date or a 00:00Z instant; `toLocal()` maps
    // it to the correct Asia/Tashkent (+5) calendar day before comparison.
    final parsedDate = DateTime.tryParse(b.date)?.toLocal();
    if (parsedDate == null) continue;
    final bookingDay =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
    if (bookingDay != today) continue;

    final startParts = b.timeSlot.split(':');
    if (startParts.length < 2) continue;
    final startMin = (int.tryParse(startParts[0]) ?? 0) * 60 +
        (int.tryParse(startParts[1]) ?? 0);
    final endMin =
        b.endTime != null ? _parseTimeToMin(b.endTime!) : startMin + 120;

    // Active window wins immediately — the guest is/should be seated.
    if (refMin >= startMin && refMin < endMin) return 'waiting';

    if (startMin > refMin && (startMin - refMin) <= kReservedWindowMin) {
      hasReservedSoon = true;
    }
  }

  return hasReservedSoon ? 'reserved' : 'free';
}

int _parseTimeToMin(String hhmm) {
  final p = hhmm.split(':');
  if (p.length < 2) return 0;
  return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
}
