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
mixin _$ShiftEntity {
  String get id => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

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
  });

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

  @override
  String toString() {
    return 'ShiftEntity(id: $id, staffName: $staffName, startTime: $startTime, endTime: $endTime, date: $date, restaurantId: $restaurantId, createdAt: $createdAt, notes: $notes)';
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
            (identical(other.notes, notes) || other.notes == notes));
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

  /// Create a copy of ShiftEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
