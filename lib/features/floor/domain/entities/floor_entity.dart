import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_entity.freezed.dart';

/// Domain entity representing a restaurant floor layout.
@freezed
abstract class FloorEntity with _$FloorEntity {
  const factory FloorEntity({
    required String id,
    required String name,
    @Default(0) int tableCount,
    @Default(0) int capacity,
  }) = _FloorEntity;
}
