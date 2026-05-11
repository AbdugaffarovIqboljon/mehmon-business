import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';

part 'activity_log_model.freezed.dart';
part 'activity_log_model.g.dart';

@freezed
abstract class ActivityLogModel with _$ActivityLogModel {
  const factory ActivityLogModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'restaurantId') required String restaurantId,
    @JsonKey(name: 'action') required String action,
    @JsonKey(name: 'details') required String details,
    @JsonKey(name: 'performedBy') required String performedBy,
    @JsonKey(name: 'createdAt') required String createdAt,
  }) = _ActivityLogModel;

  factory ActivityLogModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogModelFromJson(json);
}

extension ActivityLogModelX on ActivityLogModel {
  ActivityLogEntity toEntity() => ActivityLogEntity(
        id: id,
        restaurantId: restaurantId,
        action: action,
        details: details,
        performedBy: performedBy,
        createdAt: createdAt,
      );
}
