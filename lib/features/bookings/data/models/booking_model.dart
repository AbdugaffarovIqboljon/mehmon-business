import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';

export 'package:mehmon/features/bookings/domain/entities/booking_entity.dart'
    show BookingType;

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

const Map<BookingType, String> _bookingTypeJson = {
  BookingType.standard: 'Standard',
  BookingType.banket: 'Banket',
};

BookingType? _bookingTypeFromJson(Object? value) => switch (value) {
  'Standard' => BookingType.standard,
  'Banket' => BookingType.banket,
  _ => null,
};

String? _bookingTypeToJson(BookingType? value) =>
    value == null ? null : _bookingTypeJson[value];

@freezed
abstract class TableInfoModel with _$TableInfoModel {
  const factory TableInfoModel({
    @JsonKey(name: '_id') required String id,
    required String number,
    required int capacity,
  }) = _TableInfoModel;

  factory TableInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TableInfoModelFromJson(json);
}

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name: '_id') required String id,
    required String guestName,
    required String phone,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String createdAt,
    TableInfoModel? tableId,
    String? endTime,
    @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
    BookingType? bookingType,
    @Default('pending') String status,
    String? notes,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
