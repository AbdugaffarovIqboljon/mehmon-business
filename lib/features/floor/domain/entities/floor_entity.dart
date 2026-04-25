import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_entity.freezed.dart';

@freezed
abstract class FloorEntity with _$FloorEntity {
  const factory FloorEntity({
    required String id,
    required String number,
    required int capacity,
    required String status,
    required String location,
    @Default(null) String? tableType,
    @Default(0.0) double x,
    @Default(0.0) double y,
  }) = _FloorEntity;
}

extension FloorEntityX on FloorEntity {
  /// Display number: extracts numeric part from "T-1775215881601"
  /// or returns number as-is if it's already clean like "T-01"
  String get displayNumber {
    final parts = number.split('-');
    if (parts.length >= 2) {
      final numeric = int.tryParse(parts.last);
      if (numeric != null && numeric > 1000) {
        return number;
      }
    }
    return number;
  }

  bool get isAvailable => status == 'available';
  bool get isOccupied => status == 'occupied';
}
