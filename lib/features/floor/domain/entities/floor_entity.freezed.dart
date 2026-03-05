// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FloorEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get tableCount => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;

  /// Create a copy of FloorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloorEntityCopyWith<FloorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorEntityCopyWith<$Res> {
  factory $FloorEntityCopyWith(
    FloorEntity value,
    $Res Function(FloorEntity) then,
  ) = _$FloorEntityCopyWithImpl<$Res, FloorEntity>;
  @useResult
  $Res call({String id, String name, int tableCount, int capacity});
}

/// @nodoc
class _$FloorEntityCopyWithImpl<$Res, $Val extends FloorEntity>
    implements $FloorEntityCopyWith<$Res> {
  _$FloorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tableCount = null,
    Object? capacity = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            tableCount: null == tableCount
                ? _value.tableCount
                : tableCount // ignore: cast_nullable_to_non_nullable
                      as int,
            capacity: null == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FloorEntityImplCopyWith<$Res>
    implements $FloorEntityCopyWith<$Res> {
  factory _$$FloorEntityImplCopyWith(
    _$FloorEntityImpl value,
    $Res Function(_$FloorEntityImpl) then,
  ) = __$$FloorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int tableCount, int capacity});
}

/// @nodoc
class __$$FloorEntityImplCopyWithImpl<$Res>
    extends _$FloorEntityCopyWithImpl<$Res, _$FloorEntityImpl>
    implements _$$FloorEntityImplCopyWith<$Res> {
  __$$FloorEntityImplCopyWithImpl(
    _$FloorEntityImpl _value,
    $Res Function(_$FloorEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tableCount = null,
    Object? capacity = null,
  }) {
    return _then(
      _$FloorEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        tableCount: null == tableCount
            ? _value.tableCount
            : tableCount // ignore: cast_nullable_to_non_nullable
                  as int,
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$FloorEntityImpl implements _FloorEntity {
  const _$FloorEntityImpl({
    required this.id,
    required this.name,
    this.tableCount = 0,
    this.capacity = 0,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final int tableCount;
  @override
  @JsonKey()
  final int capacity;

  @override
  String toString() {
    return 'FloorEntity(id: $id, name: $name, tableCount: $tableCount, capacity: $capacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tableCount, tableCount) ||
                other.tableCount == tableCount) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, tableCount, capacity);

  /// Create a copy of FloorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorEntityImplCopyWith<_$FloorEntityImpl> get copyWith =>
      __$$FloorEntityImplCopyWithImpl<_$FloorEntityImpl>(this, _$identity);
}

abstract class _FloorEntity implements FloorEntity {
  const factory _FloorEntity({
    required final String id,
    required final String name,
    final int tableCount,
    final int capacity,
  }) = _$FloorEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  int get tableCount;
  @override
  int get capacity;

  /// Create a copy of FloorEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorEntityImplCopyWith<_$FloorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
