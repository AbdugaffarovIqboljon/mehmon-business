import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/data/models/activity_log_model.dart';

part 'activity_log_entity.freezed.dart';

@freezed
abstract class ActivityLogEntity with _$ActivityLogEntity {
  const factory ActivityLogEntity({
    required String id,
    required String restaurantId,
    required String action,
    required String details,
    required String performedBy,
    required String createdAt,
  }) = _ActivityLogEntity;

  factory ActivityLogEntity.fromModel(ActivityLogModel model) =>
      ActivityLogEntity(
        id: model.id,
        restaurantId: model.restaurantId,
        action: model.action,
        details: model.details,
        performedBy: model.performedBy,
        createdAt: model.createdAt,
      );
}

extension ActivityLogEntityX on ActivityLogEntity {
  DateTime? get createdAtDateTime => DateTime.tryParse(createdAt)?.toLocal();
}
