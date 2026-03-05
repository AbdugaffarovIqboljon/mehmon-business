import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_model.freezed.dart';
part 'floor_model.g.dart';

@freezed
abstract class FloorModel with _$FloorModel {
  const factory FloorModel({
    required String id,
    required String name,
    @JsonKey(name: 'table_count') @Default(0) int tableCount,
    @Default(0) int capacity,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, dynamic> json) =>
      _$FloorModelFromJson(json);
}
