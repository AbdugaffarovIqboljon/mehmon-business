// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GuestEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isVip => throw _privateConstructorUsedError;

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestEntityCopyWith<GuestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestEntityCopyWith<$Res> {
  factory $GuestEntityCopyWith(
    GuestEntity value,
    $Res Function(GuestEntity) then,
  ) = _$GuestEntityCopyWithImpl<$Res, GuestEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String? phone,
    String? email,
    int visitCount,
    String? notes,
    bool isVip,
  });
}

/// @nodoc
class _$GuestEntityCopyWithImpl<$Res, $Val extends GuestEntity>
    implements $GuestEntityCopyWith<$Res> {
  _$GuestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
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
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitCount: null == visitCount
                ? _value.visitCount
                : visitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVip: null == isVip
                ? _value.isVip
                : isVip // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestEntityImplCopyWith<$Res>
    implements $GuestEntityCopyWith<$Res> {
  factory _$$GuestEntityImplCopyWith(
    _$GuestEntityImpl value,
    $Res Function(_$GuestEntityImpl) then,
  ) = __$$GuestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? phone,
    String? email,
    int visitCount,
    String? notes,
    bool isVip,
  });
}

/// @nodoc
class __$$GuestEntityImplCopyWithImpl<$Res>
    extends _$GuestEntityCopyWithImpl<$Res, _$GuestEntityImpl>
    implements _$$GuestEntityImplCopyWith<$Res> {
  __$$GuestEntityImplCopyWithImpl(
    _$GuestEntityImpl _value,
    $Res Function(_$GuestEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
  }) {
    return _then(
      _$GuestEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitCount: null == visitCount
            ? _value.visitCount
            : visitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVip: null == isVip
            ? _value.isVip
            : isVip // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$GuestEntityImpl implements _GuestEntity {
  const _$GuestEntityImpl({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.visitCount = 0,
    this.notes,
    this.isVip = false,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey()
  final int visitCount;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isVip;

  @override
  String toString() {
    return 'GuestEntity(id: $id, name: $name, phone: $phone, email: $email, visitCount: $visitCount, notes: $notes, isVip: $isVip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isVip, isVip) || other.isVip == isVip));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    email,
    visitCount,
    notes,
    isVip,
  );

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestEntityImplCopyWith<_$GuestEntityImpl> get copyWith =>
      __$$GuestEntityImplCopyWithImpl<_$GuestEntityImpl>(this, _$identity);
}

abstract class _GuestEntity implements GuestEntity {
  const factory _GuestEntity({
    required final String id,
    required final String name,
    final String? phone,
    final String? email,
    final int visitCount,
    final String? notes,
    final bool isVip,
  }) = _$GuestEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  int get visitCount;
  @override
  String? get notes;
  @override
  bool get isVip;

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestEntityImplCopyWith<_$GuestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
