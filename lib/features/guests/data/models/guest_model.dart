import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String phone,
    required int visitCount,
    required bool isVIP,
    required String lastVisit,
    String? email,
    String? notes,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
