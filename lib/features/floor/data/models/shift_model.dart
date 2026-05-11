import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

@freezed
abstract class ShiftModel with _$ShiftModel {
  const factory ShiftModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'staffName') required String staffName,
    @JsonKey(name: 'startTime') required String startTime,
    @JsonKey(name: 'endTime') required String endTime,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'restaurantId') required String restaurantId,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'notes') String? notes,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);
}

extension ShiftModelX on ShiftModel {
  ShiftEntity toEntity() => ShiftEntity(
        id: id,
        staffName: staffName,
        startTime: startTime,
        endTime: endTime,
        date: date,
        notes: notes,
        restaurantId: restaurantId,
        createdAt: createdAt,
      );
}
