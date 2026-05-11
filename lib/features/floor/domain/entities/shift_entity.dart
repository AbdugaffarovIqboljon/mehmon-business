import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/data/models/shift_model.dart';

part 'shift_entity.freezed.dart';

@freezed
abstract class ShiftEntity with _$ShiftEntity {
  const factory ShiftEntity({
    required String id,
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    required String restaurantId,
    required String createdAt,
    String? notes,
  }) = _ShiftEntity;

  factory ShiftEntity.fromModel(ShiftModel model) => ShiftEntity(
        id: model.id,
        staffName: model.staffName,
        startTime: model.startTime,
        endTime: model.endTime,
        date: model.date,
        restaurantId: model.restaurantId,
        createdAt: model.createdAt,
        notes: model.notes,
      );
}
