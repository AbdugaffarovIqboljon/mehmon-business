import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    @JsonKey(name: 'guest_name') required String guestName,
    @JsonKey(name: 'date_time') required DateTime dateTime,
    @JsonKey(name: 'party_size') @Default(2) int partySize,
    @Default('pending') String status,
    String? notes,
    @JsonKey(name: 'table_id') String? tableId,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
