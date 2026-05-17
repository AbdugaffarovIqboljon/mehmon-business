// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AssignedTableEntity {
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;

  /// Create a copy of AssignedTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssignedTableEntityCopyWith<AssignedTableEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedTableEntityCopyWith<$Res> {
  factory $AssignedTableEntityCopyWith(
    AssignedTableEntity value,
    $Res Function(AssignedTableEntity) then,
  ) = _$AssignedTableEntityCopyWithImpl<$Res, AssignedTableEntity>;
  @useResult
  $Res call({String id, String number});
}

/// @nodoc
class _$AssignedTableEntityCopyWithImpl<$Res, $Val extends AssignedTableEntity>
    implements $AssignedTableEntityCopyWith<$Res> {
  _$AssignedTableEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignedTableEntity
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
abstract class _$$AssignedTableEntityImplCopyWith<$Res>
    implements $AssignedTableEntityCopyWith<$Res> {
  factory _$$AssignedTableEntityImplCopyWith(
    _$AssignedTableEntityImpl value,
    $Res Function(_$AssignedTableEntityImpl) then,
  ) = __$$AssignedTableEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String number});
}

/// @nodoc
class __$$AssignedTableEntityImplCopyWithImpl<$Res>
    extends _$AssignedTableEntityCopyWithImpl<$Res, _$AssignedTableEntityImpl>
    implements _$$AssignedTableEntityImplCopyWith<$Res> {
  __$$AssignedTableEntityImplCopyWithImpl(
    _$AssignedTableEntityImpl _value,
    $Res Function(_$AssignedTableEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssignedTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? number = null}) {
    return _then(
      _$AssignedTableEntityImpl(
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

class _$AssignedTableEntityImpl implements _AssignedTableEntity {
  const _$AssignedTableEntityImpl({required this.id, required this.number});

  @override
  final String id;
  @override
  final String number;

  @override
  String toString() {
    return 'AssignedTableEntity(id: $id, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedTableEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, number);

  /// Create a copy of AssignedTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedTableEntityImplCopyWith<_$AssignedTableEntityImpl> get copyWith =>
      __$$AssignedTableEntityImplCopyWithImpl<_$AssignedTableEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _AssignedTableEntity implements AssignedTableEntity {
  const factory _AssignedTableEntity({
    required final String id,
    required final String number,
  }) = _$AssignedTableEntityImpl;

  @override
  String get id;
  @override
  String get number;

  /// Create a copy of AssignedTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignedTableEntityImplCopyWith<_$AssignedTableEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShiftEntity {
  String get id => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<AssignedTableEntity> get assignedTables =>
      throw _privateConstructorUsedError;

  /// Create a copy of ShiftEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftEntityCopyWith<ShiftEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEntityCopyWith<$Res> {
  factory $ShiftEntityCopyWith(
    ShiftEntity value,
    $Res Function(ShiftEntity) then,
  ) = _$ShiftEntityCopyWithImpl<$Res, ShiftEntity>;
  @useResult
  $Res call({
    String id,
    String staffName,
    String startTime,
    String endTime,
    String date,
    String restaurantId,
    String createdAt,
    String? notes,
    List<AssignedTableEntity> assignedTables,
  });
}

/// @nodoc
class _$ShiftEntityCopyWithImpl<$Res, $Val extends ShiftEntity>
    implements $ShiftEntityCopyWith<$Res> {
  _$ShiftEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEntity
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
                      as List<AssignedTableEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShiftEntityImplCopyWith<$Res>
    implements $ShiftEntityCopyWith<$Res> {
  factory _$$ShiftEntityImplCopyWith(
    _$ShiftEntityImpl value,
    $Res Function(_$ShiftEntityImpl) then,
  ) = __$$ShiftEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String staffName,
    String startTime,
    String endTime,
    String date,
    String restaurantId,
    String createdAt,
    String? notes,
    List<AssignedTableEntity> assignedTables,
  });
}

/// @nodoc
class __$$ShiftEntityImplCopyWithImpl<$Res>
    extends _$ShiftEntityCopyWithImpl<$Res, _$ShiftEntityImpl>
    implements _$$ShiftEntityImplCopyWith<$Res> {
  __$$ShiftEntityImplCopyWithImpl(
    _$ShiftEntityImpl _value,
    $Res Function(_$ShiftEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftEntity
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
      _$ShiftEntityImpl(
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
                  as List<AssignedTableEntity>,
      ),
    );
  }
}

/// @nodoc

class _$ShiftEntityImpl implements _ShiftEntity {
  const _$ShiftEntityImpl({
    required this.id,
    required this.staffName,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.restaurantId,
    required this.createdAt,
    this.notes,
    final List<AssignedTableEntity> assignedTables = const [],
  }) : _assignedTables = assignedTables;

  @override
  final String id;
  @override
  final String staffName;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String date;
  @override
  final String restaurantId;
  @override
  final String createdAt;
  @override
  final String? notes;
  final List<AssignedTableEntity> _assignedTables;
  @override
  @JsonKey()
  List<AssignedTableEntity> get assignedTables {
    if (_assignedTables is EqualUnmodifiableListView) return _assignedTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedTables);
  }

  @override
  String toString() {
    return 'ShiftEntity(id: $id, staffName: $staffName, startTime: $startTime, endTime: $endTime, date: $date, restaurantId: $restaurantId, createdAt: $createdAt, notes: $notes, assignedTables: $assignedTables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEntityImpl &&
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

  /// Create a copy of ShiftEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      __$$ShiftEntityImplCopyWithImpl<_$ShiftEntityImpl>(this, _$identity);
}

abstract class _ShiftEntity implements ShiftEntity {
  const factory _ShiftEntity({
    required final String id,
    required final String staffName,
    required final String startTime,
    required final String endTime,
    required final String date,
    required final String restaurantId,
    required final String createdAt,
    final String? notes,
    final List<AssignedTableEntity> assignedTables,
  }) = _$ShiftEntityImpl;

  @override
  String get id;
  @override
  String get staffName;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get date;
  @override
  String get restaurantId;
  @override
  String get createdAt;
  @override
  String? get notes;
  @override
  List<AssignedTableEntity> get assignedTables;

  /// Create a copy of ShiftEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
