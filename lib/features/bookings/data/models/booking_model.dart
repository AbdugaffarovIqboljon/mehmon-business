import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

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
    required TableInfoModel tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String createdAt,
    @Default('pending') String status,
    @JsonKey(includeIfNull: true) String? notes,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
