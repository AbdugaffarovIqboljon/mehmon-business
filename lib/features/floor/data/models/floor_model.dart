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
    @JsonKey(name: 'location') String? location,
    @Default(0.0) double x,
    @Default(0.0) double y,
    @Default(0.0) double rotation,
    @JsonKey(name: 'zone') String? zone,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, dynamic> json) =>
      _$FloorModelFromJson(json);
}
