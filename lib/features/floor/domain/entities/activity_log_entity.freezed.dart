// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ActivityLogEntity {
  String get id => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String get performedBy => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ActivityLogEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityLogEntityCopyWith<ActivityLogEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityLogEntityCopyWith<$Res> {
  factory $ActivityLogEntityCopyWith(
    ActivityLogEntity value,
    $Res Function(ActivityLogEntity) then,
  ) = _$ActivityLogEntityCopyWithImpl<$Res, ActivityLogEntity>;
  @useResult
  $Res call({
    String id,
    String restaurantId,
    String action,
    String details,
    String performedBy,
    String createdAt,
  });
}

/// @nodoc
class _$ActivityLogEntityCopyWithImpl<$Res, $Val extends ActivityLogEntity>
    implements $ActivityLogEntityCopyWith<$Res> {
  _$ActivityLogEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityLogEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? action = null,
    Object? details = null,
    Object? performedBy = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantId: null == restaurantId
                ? _value.restaurantId
                : restaurantId // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String,
            performedBy: null == performedBy
                ? _value.performedBy
                : performedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActivityLogEntityImplCopyWith<$Res>
    implements $ActivityLogEntityCopyWith<$Res> {
  factory _$$ActivityLogEntityImplCopyWith(
    _$ActivityLogEntityImpl value,
    $Res Function(_$ActivityLogEntityImpl) then,
  ) = __$$ActivityLogEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String restaurantId,
    String action,
    String details,
    String performedBy,
    String createdAt,
  });
}

/// @nodoc
class __$$ActivityLogEntityImplCopyWithImpl<$Res>
    extends _$ActivityLogEntityCopyWithImpl<$Res, _$ActivityLogEntityImpl>
    implements _$$ActivityLogEntityImplCopyWith<$Res> {
  __$$ActivityLogEntityImplCopyWithImpl(
    _$ActivityLogEntityImpl _value,
    $Res Function(_$ActivityLogEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityLogEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? action = null,
    Object? details = null,
    Object? performedBy = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ActivityLogEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantId: null == restaurantId
            ? _value.restaurantId
            : restaurantId // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        details: null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
        performedBy: null == performedBy
            ? _value.performedBy
            : performedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ActivityLogEntityImpl implements _ActivityLogEntity {
  const _$ActivityLogEntityImpl({
    required this.id,
    required this.restaurantId,
    required this.action,
    required this.details,
    required this.performedBy,
    required this.createdAt,
  });

  @override
  final String id;
  @override
  final String restaurantId;
  @override
  final String action;
  @override
  final String details;
  @override
  final String performedBy;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'ActivityLogEntity(id: $id, restaurantId: $restaurantId, action: $action, details: $details, performedBy: $performedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLogEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    restaurantId,
    action,
    details,
    performedBy,
    createdAt,
  );

  /// Create a copy of ActivityLogEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLogEntityImplCopyWith<_$ActivityLogEntityImpl> get copyWith =>
      __$$ActivityLogEntityImplCopyWithImpl<_$ActivityLogEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _ActivityLogEntity implements ActivityLogEntity {
  const factory _ActivityLogEntity({
    required final String id,
    required final String restaurantId,
    required final String action,
    required final String details,
    required final String performedBy,
    required final String createdAt,
  }) = _$ActivityLogEntityImpl;

  @override
  String get id;
  @override
  String get restaurantId;
  @override
  String get action;
  @override
  String get details;
  @override
  String get performedBy;
  @override
  String get createdAt;

  /// Create a copy of ActivityLogEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityLogEntityImplCopyWith<_$ActivityLogEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
