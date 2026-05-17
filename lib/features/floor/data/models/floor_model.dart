import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_model.freezed.dart';
part 'floor_model.g.dart';

@freezed
abstract class FloorModel with _$FloorModel {
  const factory FloorModel({
    @JsonKey(name: '_id') required String id,
    required String number,
    required int capacity,
    required String status,
    required String location,
    @Default(0.0) double x,
    @Default(0.0) double y,
    String? zone,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, dynamic> json) =>
      _$FloorModelFromJson(json);
}
