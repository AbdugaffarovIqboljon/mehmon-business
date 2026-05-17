import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
abstract class VisitModel with _$VisitModel {
  const factory VisitModel({
    @JsonKey(name: '_id') required String id,
    required String date,
    required String tableNumber,
    required int numberOfGuests,
  }) = _VisitModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) =>
      _$VisitModelFromJson(json);
}

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String phone,
    required int visitCount,
    @JsonKey(defaultValue: []) required List<VisitModel> visits,
    required bool isVIP,
    required String lastVisit,
    @JsonKey(defaultValue: 0) required int lastVisitGuestCount,
    String? email,
    String? avatarUrl,
    String? notes,
    String? lastVisitTableNumber,
    String? currentTableId,
    String? bookingId,
    String? bookingTimeSlot,
    String? bookingEndTime,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
