// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Create a copy of AuthEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthEntityCopyWith<AuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEntityCopyWith<$Res> {
  factory $AuthEntityCopyWith(
    AuthEntity value,
    $Res Function(AuthEntity) then,
  ) = _$AuthEntityCopyWithImpl<$Res, AuthEntity>;
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String? phone,
    String? avatarUrl,
    String role,
  });
}

/// @nodoc
class _$AuthEntityCopyWithImpl<$Res, $Val extends AuthEntity>
    implements $AuthEntityCopyWith<$Res> {
  _$AuthEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? role = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthEntityImplCopyWith<$Res>
    implements $AuthEntityCopyWith<$Res> {
  factory _$$AuthEntityImplCopyWith(
    _$AuthEntityImpl value,
    $Res Function(_$AuthEntityImpl) then,
  ) = __$$AuthEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String? phone,
    String? avatarUrl,
    String role,
  });
}

/// @nodoc
class __$$AuthEntityImplCopyWithImpl<$Res>
    extends _$AuthEntityCopyWithImpl<$Res, _$AuthEntityImpl>
    implements _$$AuthEntityImplCopyWith<$Res> {
  __$$AuthEntityImplCopyWithImpl(
    _$AuthEntityImpl _value,
    $Res Function(_$AuthEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? role = null,
  }) {
    return _then(
      _$AuthEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEntityImpl implements _AuthEntity {
  const _$AuthEntityImpl({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.avatarUrl,
    this.role = 'staff',
  });

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'AuthEntity(id: $id, email: $email, name: $name, phone: $phone, avatarUrl: $avatarUrl, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, phone, avatarUrl, role);

  /// Create a copy of AuthEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      __$$AuthEntityImplCopyWithImpl<_$AuthEntityImpl>(this, _$identity);
}

abstract class _AuthEntity implements AuthEntity {
  const factory _AuthEntity({
    required final String id,
    required final String email,
    required final String name,
    final String? phone,
    final String? avatarUrl,
    final String role,
  }) = _$AuthEntityImpl;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get avatarUrl;
  @override
  String get role;

  /// Create a copy of AuthEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
