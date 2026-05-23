// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssignedTableModel _$AssignedTableModelFromJson(Map<String, dynamic> json) {
  return _AssignedTableModel.fromJson(json);
}

/// @nodoc
mixin _$AssignedTableModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;

  /// Serializes this AssignedTableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssignedTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssignedTableModelCopyWith<AssignedTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedTableModelCopyWith<$Res> {
  factory $AssignedTableModelCopyWith(
    AssignedTableModel value,
    $Res Function(AssignedTableModel) then,
  ) = _$AssignedTableModelCopyWithImpl<$Res, AssignedTableModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String number});
}

/// @nodoc
class _$AssignedTableModelCopyWithImpl<$Res, $Val extends AssignedTableModel>
    implements $AssignedTableModelCopyWith<$Res> {
  _$AssignedTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignedTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? number = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssignedTableModelImplCopyWith<$Res>
    implements $AssignedTableModelCopyWith<$Res> {
  factory _$$AssignedTableModelImplCopyWith(
    _$AssignedTableModelImpl value,
    $Res Function(_$AssignedTableModelImpl) then,
  ) = __$$AssignedTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String number});
}

/// @nodoc
class __$$AssignedTableModelImplCopyWithImpl<$Res>
    extends _$AssignedTableModelCopyWithImpl<$Res, _$AssignedTableModelImpl>
    implements _$$AssignedTableModelImplCopyWith<$Res> {
  __$$AssignedTableModelImplCopyWithImpl(
    _$AssignedTableModelImpl _value,
    $Res Function(_$AssignedTableModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssignedTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? number = null}) {
    return _then(
      _$AssignedTableModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignedTableModelImpl implements _AssignedTableModel {
  const _$AssignedTableModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.number,
  });

  factory _$AssignedTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignedTableModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String number;

  @override
  String toString() {
    return 'AssignedTableModel(id: $id, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedTableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number);

  /// Create a copy of AssignedTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedTableModelImplCopyWith<_$AssignedTableModelImpl> get copyWith =>
      __$$AssignedTableModelImplCopyWithImpl<_$AssignedTableModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignedTableModelImplToJson(this);
  }
}

abstract class _AssignedTableModel implements AssignedTableModel {
  const factory _AssignedTableModel({
    @JsonKey(name: '_id') required final String id,
    required final String number,
  }) = _$AssignedTableModelImpl;

  factory _AssignedTableModel.fromJson(Map<String, dynamic> json) =
      _$AssignedTableModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get number;

  /// Create a copy of AssignedTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignedTableModelImplCopyWith<_$AssignedTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) {
  return _ShiftModel.fromJson(json);
}

/// @nodoc
mixin _$ShiftModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffName')
  String get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'startTime')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'endTime')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantId')
  String get restaurantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _assignedTablesFromJson)
  List<AssignedTableModel> get assignedTables =>
      throw _privateConstructorUsedError;

  /// Serializes this ShiftModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftModelCopyWith<ShiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftModelCopyWith<$Res> {
  factory $ShiftModelCopyWith(
    ShiftModel value,
    $Res Function(ShiftModel) then,
  ) = _$ShiftModelCopyWithImpl<$Res, ShiftModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'staffName') String staffName,
    @JsonKey(name: 'startTime') String startTime,
    @JsonKey(name: 'endTime') String endTime,
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'restaurantId') String restaurantId,
    @JsonKey(name: 'createdAt') String createdAt,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(fromJson: _assignedTablesFromJson)
    List<AssignedTableModel> assignedTables,
  });
}

/// @nodoc
class _$ShiftModelCopyWithImpl<$Res, $Val extends ShiftModel>
    implements $ShiftModelCopyWith<$Res> {
  _$ShiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? staffName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? date = null,
    Object? restaurantId = null,
    Object? createdAt = null,
    Object? notes = freezed,
    Object? assignedTables = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            staffName: null == staffName
                ? _value.staffName
                : staffName // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantId: null == restaurantId
                ? _value.restaurantId
                : restaurantId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTables: null == assignedTables
                ? _value.assignedTables
                : assignedTables // ignore: cast_nullable_to_non_nullable
                      as List<AssignedTableModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShiftModelImplCopyWith<$Res>
    implements $ShiftModelCopyWith<$Res> {
  factory _$$ShiftModelImplCopyWith(
    _$ShiftModelImpl value,
    $Res Function(_$ShiftModelImpl) then,
  ) = __$$ShiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'staffName') String staffName,
    @JsonKey(name: 'startTime') String startTime,
    @JsonKey(name: 'endTime') String endTime,
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'restaurantId') String restaurantId,
    @JsonKey(name: 'createdAt') String createdAt,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(fromJson: _assignedTablesFromJson)
    List<AssignedTableModel> assignedTables,
  });
}

/// @nodoc
class __$$ShiftModelImplCopyWithImpl<$Res>
    extends _$ShiftModelCopyWithImpl<$Res, _$ShiftModelImpl>
    implements _$$ShiftModelImplCopyWith<$Res> {
  __$$ShiftModelImplCopyWithImpl(
    _$ShiftModelImpl _value,
    $Res Function(_$ShiftModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? staffName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? date = null,
    Object? restaurantId = null,
    Object? createdAt = null,
    Object? notes = freezed,
    Object? assignedTables = null,
  }) {
    return _then(
      _$ShiftModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        staffName: null == staffName
            ? _value.staffName
            : staffName // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantId: null == restaurantId
            ? _value.restaurantId
            : restaurantId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTables: null == assignedTables
            ? _value._assignedTables
            : assignedTables // ignore: cast_nullable_to_non_nullable
                  as List<AssignedTableModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftModelImpl implements _ShiftModel {
  const _$ShiftModelImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'staffName') required this.staffName,
    @JsonKey(name: 'startTime') required this.startTime,
    @JsonKey(name: 'endTime') required this.endTime,
    @JsonKey(name: 'date') required this.date,
    @JsonKey(name: 'restaurantId') required this.restaurantId,
    @JsonKey(name: 'createdAt') required this.createdAt,
    @JsonKey(name: 'notes') this.notes,
    @JsonKey(fromJson: _assignedTablesFromJson)
    final List<AssignedTableModel> assignedTables = const [],
  }) : _assignedTables = assignedTables;

  factory _$ShiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'staffName')
  final String staffName;
  @override
  @JsonKey(name: 'startTime')
  final String startTime;
  @override
  @JsonKey(name: 'endTime')
  final String endTime;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'restaurantId')
  final String restaurantId;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  final List<AssignedTableModel> _assignedTables;
  @override
  @JsonKey(fromJson: _assignedTablesFromJson)
  List<AssignedTableModel> get assignedTables {
    if (_assignedTables is EqualUnmodifiableListView) return _assignedTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedTables);
  }

  @override
  String toString() {
    return 'ShiftModel(id: $id, staffName: $staffName, startTime: $startTime, endTime: $endTime, date: $date, restaurantId: $restaurantId, createdAt: $createdAt, notes: $notes, assignedTables: $assignedTables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._assignedTables,
              _assignedTables,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    staffName,
    startTime,
    endTime,
    date,
    restaurantId,
    createdAt,
    notes,
    const DeepCollectionEquality().hash(_assignedTables),
  );

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      __$$ShiftModelImplCopyWithImpl<_$ShiftModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftModelImplToJson(this);
  }
}

abstract class _ShiftModel implements ShiftModel {
  const factory _ShiftModel({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'staffName') required final String staffName,
    @JsonKey(name: 'startTime') required final String startTime,
    @JsonKey(name: 'endTime') required final String endTime,
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'restaurantId') required final String restaurantId,
    @JsonKey(name: 'createdAt') required final String createdAt,
    @JsonKey(name: 'notes') final String? notes,
    @JsonKey(fromJson: _assignedTablesFromJson)
    final List<AssignedTableModel> assignedTables,
  }) = _$ShiftModelImpl;

  factory _ShiftModel.fromJson(Map<String, dynamic> json) =
      _$ShiftModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'staffName')
  String get staffName;
  @override
  @JsonKey(name: 'startTime')
  String get startTime;
  @override
  @JsonKey(name: 'endTime')
  String get endTime;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'restaurantId')
  String get restaurantId;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(fromJson: _assignedTablesFromJson)
  List<AssignedTableModel> get assignedTables;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
