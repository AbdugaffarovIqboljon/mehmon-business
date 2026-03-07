import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
abstract class GuestVisitModel with _$GuestVisitModel {
  const factory GuestVisitModel({
    required String date,
    @JsonKey(name: 'table_label') required String tableLabel,
    @JsonKey(name: 'guest_count') @Default(1) int guestCount,
  }) = _GuestVisitModel;

  factory GuestVisitModel.fromJson(Map<String, dynamic> json) =>
      _$GuestVisitModelFromJson(json);
}

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    required String id,
    required String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    String? email,
    @JsonKey(name: 'table_label') String? tableLabel,
    @JsonKey(name: 'visit_date') String? visitDate,
    @JsonKey(name: 'guest_count') @Default(1) int guestCount,
    @JsonKey(name: 'visit_count') @Default(0) int visitCount,
    String? notes,
    @JsonKey(name: 'is_vip') @Default(false) bool isVip,
    @JsonKey(name: 'is_in_hall') @Default(false) bool isInHall,
    @JsonKey(name: 'visit_history')
    @Default(<GuestVisitModel>[])
    List<GuestVisitModel> visitHistory,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
