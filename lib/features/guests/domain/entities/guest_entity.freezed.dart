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
mixin _$GuestVisitEntity {
  String get date => throw _privateConstructorUsedError;
  String get tableLabel => throw _privateConstructorUsedError;
  int get guestCount => throw _privateConstructorUsedError;

  /// Create a copy of GuestVisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestVisitEntityCopyWith<GuestVisitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestVisitEntityCopyWith<$Res> {
  factory $GuestVisitEntityCopyWith(
    GuestVisitEntity value,
    $Res Function(GuestVisitEntity) then,
  ) = _$GuestVisitEntityCopyWithImpl<$Res, GuestVisitEntity>;
  @useResult
  $Res call({String date, String tableLabel, int guestCount});
}

/// @nodoc
class _$GuestVisitEntityCopyWithImpl<$Res, $Val extends GuestVisitEntity>
    implements $GuestVisitEntityCopyWith<$Res> {
  _$GuestVisitEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestVisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tableLabel = null,
    Object? guestCount = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            tableLabel: null == tableLabel
                ? _value.tableLabel
                : tableLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestVisitEntityImplCopyWith<$Res>
    implements $GuestVisitEntityCopyWith<$Res> {
  factory _$$GuestVisitEntityImplCopyWith(
    _$GuestVisitEntityImpl value,
    $Res Function(_$GuestVisitEntityImpl) then,
  ) = __$$GuestVisitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String tableLabel, int guestCount});
}

/// @nodoc
class __$$GuestVisitEntityImplCopyWithImpl<$Res>
    extends _$GuestVisitEntityCopyWithImpl<$Res, _$GuestVisitEntityImpl>
    implements _$$GuestVisitEntityImplCopyWith<$Res> {
  __$$GuestVisitEntityImplCopyWithImpl(
    _$GuestVisitEntityImpl _value,
    $Res Function(_$GuestVisitEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestVisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tableLabel = null,
    Object? guestCount = null,
  }) {
    return _then(
      _$GuestVisitEntityImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        tableLabel: null == tableLabel
            ? _value.tableLabel
            : tableLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GuestVisitEntityImpl implements _GuestVisitEntity {
  const _$GuestVisitEntityImpl({
    required this.date,
    required this.tableLabel,
    this.guestCount = 1,
  });

  @override
  final String date;
  @override
  final String tableLabel;
  @override
  @JsonKey()
  final int guestCount;

  @override
  String toString() {
    return 'GuestVisitEntity(date: $date, tableLabel: $tableLabel, guestCount: $guestCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestVisitEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, tableLabel, guestCount);

  /// Create a copy of GuestVisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestVisitEntityImplCopyWith<_$GuestVisitEntityImpl> get copyWith =>
      __$$GuestVisitEntityImplCopyWithImpl<_$GuestVisitEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _GuestVisitEntity implements GuestVisitEntity {
  const factory _GuestVisitEntity({
    required final String date,
    required final String tableLabel,
    final int guestCount,
  }) = _$GuestVisitEntityImpl;

  @override
  String get date;
  @override
  String get tableLabel;
  @override
  int get guestCount;

  /// Create a copy of GuestVisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestVisitEntityImplCopyWith<_$GuestVisitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GuestEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get tableLabel => throw _privateConstructorUsedError;
  String? get visitDate => throw _privateConstructorUsedError;
  int get guestCount => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isVip => throw _privateConstructorUsedError;
  bool get isInHall => throw _privateConstructorUsedError;
  List<GuestVisitEntity> get visitHistory => throw _privateConstructorUsedError;

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
    String? avatarUrl,
    String? phone,
    String? email,
    String? tableLabel,
    String? visitDate,
    int guestCount,
    int visitCount,
    String? notes,
    bool isVip,
    bool isInHall,
    List<GuestVisitEntity> visitHistory,
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
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? tableLabel = freezed,
    Object? visitDate = freezed,
    Object? guestCount = null,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
    Object? isInHall = null,
    Object? visitHistory = null,
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
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            tableLabel: freezed == tableLabel
                ? _value.tableLabel
                : tableLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitDate: freezed == visitDate
                ? _value.visitDate
                : visitDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
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
            isInHall: null == isInHall
                ? _value.isInHall
                : isInHall // ignore: cast_nullable_to_non_nullable
                      as bool,
            visitHistory: null == visitHistory
                ? _value.visitHistory
                : visitHistory // ignore: cast_nullable_to_non_nullable
                      as List<GuestVisitEntity>,
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
    String? avatarUrl,
    String? phone,
    String? email,
    String? tableLabel,
    String? visitDate,
    int guestCount,
    int visitCount,
    String? notes,
    bool isVip,
    bool isInHall,
    List<GuestVisitEntity> visitHistory,
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
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? tableLabel = freezed,
    Object? visitDate = freezed,
    Object? guestCount = null,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
    Object? isInHall = null,
    Object? visitHistory = null,
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
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableLabel: freezed == tableLabel
            ? _value.tableLabel
            : tableLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitDate: freezed == visitDate
            ? _value.visitDate
            : visitDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
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
        isInHall: null == isInHall
            ? _value.isInHall
            : isInHall // ignore: cast_nullable_to_non_nullable
                  as bool,
        visitHistory: null == visitHistory
            ? _value._visitHistory
            : visitHistory // ignore: cast_nullable_to_non_nullable
                  as List<GuestVisitEntity>,
      ),
    );
  }
}

/// @nodoc

class _$GuestEntityImpl implements _GuestEntity {
  const _$GuestEntityImpl({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.phone,
    this.email,
    this.tableLabel,
    this.visitDate,
    this.guestCount = 1,
    this.visitCount = 0,
    this.notes,
    this.isVip = false,
    this.isInHall = false,
    final List<GuestVisitEntity> visitHistory = const <GuestVisitEntity>[],
  }) : _visitHistory = visitHistory;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatarUrl;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? tableLabel;
  @override
  final String? visitDate;
  @override
  @JsonKey()
  final int guestCount;
  @override
  @JsonKey()
  final int visitCount;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isVip;
  @override
  @JsonKey()
  final bool isInHall;
  final List<GuestVisitEntity> _visitHistory;
  @override
  @JsonKey()
  List<GuestVisitEntity> get visitHistory {
    if (_visitHistory is EqualUnmodifiableListView) return _visitHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitHistory);
  }

  @override
  String toString() {
    return 'GuestEntity(id: $id, name: $name, avatarUrl: $avatarUrl, phone: $phone, email: $email, tableLabel: $tableLabel, visitDate: $visitDate, guestCount: $guestCount, visitCount: $visitCount, notes: $notes, isVip: $isVip, isInHall: $isInHall, visitHistory: $visitHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.isInHall, isInHall) ||
                other.isInHall == isInHall) &&
            const DeepCollectionEquality().equals(
              other._visitHistory,
              _visitHistory,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    avatarUrl,
    phone,
    email,
    tableLabel,
    visitDate,
    guestCount,
    visitCount,
    notes,
    isVip,
    isInHall,
    const DeepCollectionEquality().hash(_visitHistory),
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
    final String? avatarUrl,
    final String? phone,
    final String? email,
    final String? tableLabel,
    final String? visitDate,
    final int guestCount,
    final int visitCount,
    final String? notes,
    final bool isVip,
    final bool isInHall,
    final List<GuestVisitEntity> visitHistory,
  }) = _$GuestEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get tableLabel;
  @override
  String? get visitDate;
  @override
  int get guestCount;
  @override
  int get visitCount;
  @override
  String? get notes;
  @override
  bool get isVip;
  @override
  bool get isInHall;
  @override
  List<GuestVisitEntity> get visitHistory;

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestEntityImplCopyWith<_$GuestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
