import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    required String id,
    required String name,
    String? phone,
    String? email,
    @JsonKey(name: 'visit_count') @Default(0) int visitCount,
    String? notes,
    @JsonKey(name: 'is_vip') @Default(false) bool isVip,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
