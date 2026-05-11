import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_entity.freezed.dart';

enum BookingType { standard, banket }

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
