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
mixin _$VisitEntity {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get tableNumber => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;

  /// Create a copy of VisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitEntityCopyWith<VisitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitEntityCopyWith<$Res> {
  factory $VisitEntityCopyWith(
    VisitEntity value,
    $Res Function(VisitEntity) then,
  ) = _$VisitEntityCopyWithImpl<$Res, VisitEntity>;
  @useResult
  $Res call({String id, String date, String tableNumber, int numberOfGuests});
}

/// @nodoc
class _$VisitEntityCopyWithImpl<$Res, $Val extends VisitEntity>
    implements $VisitEntityCopyWith<$Res> {
  _$VisitEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? tableNumber = null,
    Object? numberOfGuests = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            tableNumber: null == tableNumber
                ? _value.tableNumber
                : tableNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            numberOfGuests: null == numberOfGuests
                ? _value.numberOfGuests
                : numberOfGuests // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisitEntityImplCopyWith<$Res>
    implements $VisitEntityCopyWith<$Res> {
  factory _$$VisitEntityImplCopyWith(
    _$VisitEntityImpl value,
    $Res Function(_$VisitEntityImpl) then,
  ) = __$$VisitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String date, String tableNumber, int numberOfGuests});
}

/// @nodoc
class __$$VisitEntityImplCopyWithImpl<$Res>
    extends _$VisitEntityCopyWithImpl<$Res, _$VisitEntityImpl>
    implements _$$VisitEntityImplCopyWith<$Res> {
  __$$VisitEntityImplCopyWithImpl(
    _$VisitEntityImpl _value,
    $Res Function(_$VisitEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? tableNumber = null,
    Object? numberOfGuests = null,
  }) {
    return _then(
      _$VisitEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        tableNumber: null == tableNumber
            ? _value.tableNumber
            : tableNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        numberOfGuests: null == numberOfGuests
            ? _value.numberOfGuests
            : numberOfGuests // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$VisitEntityImpl implements _VisitEntity {
  const _$VisitEntityImpl({
    required this.id,
    required this.date,
    required this.tableNumber,
    required this.numberOfGuests,
  });

  @override
  final String id;
  @override
  final String date;
  @override
  final String tableNumber;
  @override
  final int numberOfGuests;

  @override
  String toString() {
    return 'VisitEntity(id: $id, date: $date, tableNumber: $tableNumber, numberOfGuests: $numberOfGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, tableNumber, numberOfGuests);

  /// Create a copy of VisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitEntityImplCopyWith<_$VisitEntityImpl> get copyWith =>
      __$$VisitEntityImplCopyWithImpl<_$VisitEntityImpl>(this, _$identity);
}

abstract class _VisitEntity implements VisitEntity {
  const factory _VisitEntity({
    required final String id,
    required final String date,
    required final String tableNumber,
    required final int numberOfGuests,
  }) = _$VisitEntityImpl;

  @override
  String get id;
  @override
  String get date;
  @override
  String get tableNumber;
  @override
  int get numberOfGuests;

  /// Create a copy of VisitEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitEntityImplCopyWith<_$VisitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GuestEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  bool get isVIP => throw _privateConstructorUsedError;
  String get lastVisit => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  List<VisitEntity> get visits => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get lastVisitTableNumber => throw _privateConstructorUsedError;
  int get lastVisitGuestCount => throw _privateConstructorUsedError;

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
    String phone,
    int visitCount,
    bool isVIP,
    String lastVisit,
    String? email,
    String? avatarUrl,
    List<VisitEntity> visits,
    String? notes,
    String? lastVisitTableNumber,
    int lastVisitGuestCount,
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
    Object? phone = null,
    Object? visitCount = null,
    Object? isVIP = null,
    Object? lastVisit = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? visits = null,
    Object? notes = freezed,
    Object? lastVisitTableNumber = freezed,
    Object? lastVisitGuestCount = null,
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
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            visitCount: null == visitCount
                ? _value.visitCount
                : visitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isVIP: null == isVIP
                ? _value.isVIP
                : isVIP // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastVisit: null == lastVisit
                ? _value.lastVisit
                : lastVisit // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            visits: null == visits
                ? _value.visits
                : visits // ignore: cast_nullable_to_non_nullable
                      as List<VisitEntity>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastVisitTableNumber: freezed == lastVisitTableNumber
                ? _value.lastVisitTableNumber
                : lastVisitTableNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastVisitGuestCount: null == lastVisitGuestCount
                ? _value.lastVisitGuestCount
                : lastVisitGuestCount // ignore: cast_nullable_to_non_nullable
                      as int,
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
    String phone,
    int visitCount,
    bool isVIP,
    String lastVisit,
    String? email,
    String? avatarUrl,
    List<VisitEntity> visits,
    String? notes,
    String? lastVisitTableNumber,
    int lastVisitGuestCount,
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
    Object? phone = null,
    Object? visitCount = null,
    Object? isVIP = null,
    Object? lastVisit = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? visits = null,
    Object? notes = freezed,
    Object? lastVisitTableNumber = freezed,
    Object? lastVisitGuestCount = null,
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
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        visitCount: null == visitCount
            ? _value.visitCount
            : visitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isVIP: null == isVIP
            ? _value.isVIP
            : isVIP // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastVisit: null == lastVisit
            ? _value.lastVisit
            : lastVisit // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        visits: null == visits
            ? _value._visits
            : visits // ignore: cast_nullable_to_non_nullable
                  as List<VisitEntity>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastVisitTableNumber: freezed == lastVisitTableNumber
            ? _value.lastVisitTableNumber
            : lastVisitTableNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastVisitGuestCount: null == lastVisitGuestCount
            ? _value.lastVisitGuestCount
            : lastVisitGuestCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GuestEntityImpl implements _GuestEntity {
  const _$GuestEntityImpl({
    required this.id,
    required this.name,
    required this.phone,
    required this.visitCount,
    required this.isVIP,
    required this.lastVisit,
    this.email,
    this.avatarUrl,
    final List<VisitEntity> visits = const [],
    this.notes,
    this.lastVisitTableNumber,
    this.lastVisitGuestCount = 0,
  }) : _visits = visits;

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final int visitCount;
  @override
  final bool isVIP;
  @override
  final String lastVisit;
  @override
  final String? email;
  @override
  final String? avatarUrl;
  final List<VisitEntity> _visits;
  @override
  @JsonKey()
  List<VisitEntity> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  @override
  final String? notes;
  @override
  final String? lastVisitTableNumber;
  @override
  @JsonKey()
  final int lastVisitGuestCount;

  @override
  String toString() {
    return 'GuestEntity(id: $id, name: $name, phone: $phone, visitCount: $visitCount, isVIP: $isVIP, lastVisit: $lastVisit, email: $email, avatarUrl: $avatarUrl, visits: $visits, notes: $notes, lastVisitTableNumber: $lastVisitTableNumber, lastVisitGuestCount: $lastVisitGuestCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.isVIP, isVIP) || other.isVIP == isVIP) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.lastVisitTableNumber, lastVisitTableNumber) ||
                other.lastVisitTableNumber == lastVisitTableNumber) &&
            (identical(other.lastVisitGuestCount, lastVisitGuestCount) ||
                other.lastVisitGuestCount == lastVisitGuestCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    visitCount,
    isVIP,
    lastVisit,
    email,
    avatarUrl,
    const DeepCollectionEquality().hash(_visits),
    notes,
    lastVisitTableNumber,
    lastVisitGuestCount,
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
    required final String phone,
    required final int visitCount,
    required final bool isVIP,
    required final String lastVisit,
    final String? email,
    final String? avatarUrl,
    final List<VisitEntity> visits,
    final String? notes,
    final String? lastVisitTableNumber,
    final int lastVisitGuestCount,
  }) = _$GuestEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  int get visitCount;
  @override
  bool get isVIP;
  @override
  String get lastVisit;
  @override
  String? get email;
  @override
  String? get avatarUrl;
  @override
  List<VisitEntity> get visits;
  @override
  String? get notes;
  @override
  String? get lastVisitTableNumber;
  @override
  int get lastVisitGuestCount;

  /// Create a copy of GuestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestEntityImplCopyWith<_$GuestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
