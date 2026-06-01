import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_entity.freezed.dart';

@freezed
abstract class FloorEntity with _$FloorEntity {
  const factory FloorEntity({
    required String id,
    required String number,
    required int capacity,
    required String status,
    String? location,
    String? tableType,
    @Default(0.0) double x,
    @Default(0.0) double y,
    @Default(0.0) double rotation,
    String? zone,
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

  /// Zone label used for grouping and filtering on the floor map. Prefers
  /// the explicit [zone], falling back to [location]. Returns `null` when
  /// neither carries a usable value so callers can treat the table as
  /// "unzoned" and leave it out of the filter chips.
  String? get effectiveLocation {
    final z = zone?.trim();
    if (z != null && z.isNotEmpty) return z;
    final l = location?.trim();
    if (l != null && l.isNotEmpty) return l;
    return null;
  }
}
