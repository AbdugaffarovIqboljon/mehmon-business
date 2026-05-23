import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

AssignedTableModel? _assignedTableFromJson(Object? value) {
  if (value == null) return null;
  if (value is String) return AssignedTableModel(id: value, number: '');
  if (value is Map<String, dynamic>) return AssignedTableModel.fromJson(value);
  return null;
}

List<AssignedTableModel> _assignedTablesFromJson(dynamic value) {
  if (value is! List) return const [];
  return value
      .map<AssignedTableModel?>(_assignedTableFromJson)
      .whereType<AssignedTableModel>()
      .toList();
}

@freezed
abstract class AssignedTableModel with _$AssignedTableModel {
  const factory AssignedTableModel({
    @JsonKey(name: '_id') required String id,
    required String number,
  }) = _AssignedTableModel;

  factory AssignedTableModel.fromJson(Map<String, dynamic> json) =>
      _$AssignedTableModelFromJson(json);
}

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
    @JsonKey(fromJson: _assignedTablesFromJson)
    @Default([]) List<AssignedTableModel> assignedTables,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);
}

extension AssignedTableModelX on AssignedTableModel {
  AssignedTableEntity toEntity() =>
      AssignedTableEntity(id: id, number: number);
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
        assignedTables:
            assignedTables.map((t) => t.toEntity()).toList(),
      );
}
