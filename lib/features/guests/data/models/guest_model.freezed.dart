// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VisitModel _$VisitModelFromJson(Map<String, dynamic> json) {
  return _VisitModel.fromJson(json);
}

/// @nodoc
mixin _$VisitModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get tableNumber => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;

  /// Serializes this VisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitModelCopyWith<VisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitModelCopyWith<$Res> {
  factory $VisitModelCopyWith(
    VisitModel value,
    $Res Function(VisitModel) then,
  ) = _$VisitModelCopyWithImpl<$Res, VisitModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String date,
    String tableNumber,
    int numberOfGuests,
  });
}

/// @nodoc
class _$VisitModelCopyWithImpl<$Res, $Val extends VisitModel>
    implements $VisitModelCopyWith<$Res> {
  _$VisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitModel
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
abstract class _$$VisitModelImplCopyWith<$Res>
    implements $VisitModelCopyWith<$Res> {
  factory _$$VisitModelImplCopyWith(
    _$VisitModelImpl value,
    $Res Function(_$VisitModelImpl) then,
  ) = __$$VisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String date,
    String tableNumber,
    int numberOfGuests,
  });
}

/// @nodoc
class __$$VisitModelImplCopyWithImpl<$Res>
    extends _$VisitModelCopyWithImpl<$Res, _$VisitModelImpl>
    implements _$$VisitModelImplCopyWith<$Res> {
  __$$VisitModelImplCopyWithImpl(
    _$VisitModelImpl _value,
    $Res Function(_$VisitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitModel
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
      _$VisitModelImpl(
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
@JsonSerializable()
class _$VisitModelImpl implements _VisitModel {
  const _$VisitModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.date,
    required this.tableNumber,
    required this.numberOfGuests,
  });

  factory _$VisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String date;
  @override
  final String tableNumber;
  @override
  final int numberOfGuests;

  @override
  String toString() {
    return 'VisitModel(id: $id, date: $date, tableNumber: $tableNumber, numberOfGuests: $numberOfGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, tableNumber, numberOfGuests);

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitModelImplCopyWith<_$VisitModelImpl> get copyWith =>
      __$$VisitModelImplCopyWithImpl<_$VisitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitModelImplToJson(this);
  }
}

abstract class _VisitModel implements VisitModel {
  const factory _VisitModel({
    @JsonKey(name: '_id') required final String id,
    required final String date,
    required final String tableNumber,
    required final int numberOfGuests,
  }) = _$VisitModelImpl;

  factory _VisitModel.fromJson(Map<String, dynamic> json) =
      _$VisitModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get date;
  @override
  String get tableNumber;
  @override
  int get numberOfGuests;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitModelImplCopyWith<_$VisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestModel _$GuestModelFromJson(Map<String, dynamic> json) {
  return _GuestModel.fromJson(json);
}

/// @nodoc
mixin _$GuestModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<VisitModel> get visits => throw _privateConstructorUsedError;
  bool get isVIP => throw _privateConstructorUsedError;
  String get lastVisit => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get lastVisitGuestCount => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get lastVisitTableNumber => throw _privateConstructorUsedError;
  String? get currentTableId => throw _privateConstructorUsedError;
  String? get bookingId => throw _privateConstructorUsedError;
  String? get bookingTimeSlot => throw _privateConstructorUsedError;
  String? get bookingEndTime => throw _privateConstructorUsedError;

  /// Serializes this GuestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestModelCopyWith<GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestModelCopyWith<$Res> {
  factory $GuestModelCopyWith(
    GuestModel value,
    $Res Function(GuestModel) then,
  ) = _$GuestModelCopyWithImpl<$Res, GuestModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String phone,
    int visitCount,
    @JsonKey(defaultValue: []) List<VisitModel> visits,
    bool isVIP,
    String lastVisit,
    @JsonKey(defaultValue: 0) int lastVisitGuestCount,
    String? email,
    String? avatarUrl,
    String? notes,
    String? lastVisitTableNumber,
    String? currentTableId,
    String? bookingId,
    String? bookingTimeSlot,
    String? bookingEndTime,
  });
}

/// @nodoc
class _$GuestModelCopyWithImpl<$Res, $Val extends GuestModel>
    implements $GuestModelCopyWith<$Res> {
  _$GuestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? visitCount = null,
    Object? visits = null,
    Object? isVIP = null,
    Object? lastVisit = null,
    Object? lastVisitGuestCount = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? notes = freezed,
    Object? lastVisitTableNumber = freezed,
    Object? currentTableId = freezed,
    Object? bookingId = freezed,
    Object? bookingTimeSlot = freezed,
    Object? bookingEndTime = freezed,
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
            visits: null == visits
                ? _value.visits
                : visits // ignore: cast_nullable_to_non_nullable
                      as List<VisitModel>,
            isVIP: null == isVIP
                ? _value.isVIP
                : isVIP // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastVisit: null == lastVisit
                ? _value.lastVisit
                : lastVisit // ignore: cast_nullable_to_non_nullable
                      as String,
            lastVisitGuestCount: null == lastVisitGuestCount
                ? _value.lastVisitGuestCount
                : lastVisitGuestCount // ignore: cast_nullable_to_non_nullable
                      as int,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastVisitTableNumber: freezed == lastVisitTableNumber
                ? _value.lastVisitTableNumber
                : lastVisitTableNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentTableId: freezed == currentTableId
                ? _value.currentTableId
                : currentTableId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingId: freezed == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingTimeSlot: freezed == bookingTimeSlot
                ? _value.bookingTimeSlot
                : bookingTimeSlot // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingEndTime: freezed == bookingEndTime
                ? _value.bookingEndTime
                : bookingEndTime // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestModelImplCopyWith<$Res>
    implements $GuestModelCopyWith<$Res> {
  factory _$$GuestModelImplCopyWith(
    _$GuestModelImpl value,
    $Res Function(_$GuestModelImpl) then,
  ) = __$$GuestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String phone,
    int visitCount,
    @JsonKey(defaultValue: []) List<VisitModel> visits,
    bool isVIP,
    String lastVisit,
    @JsonKey(defaultValue: 0) int lastVisitGuestCount,
    String? email,
    String? avatarUrl,
    String? notes,
    String? lastVisitTableNumber,
    String? currentTableId,
    String? bookingId,
    String? bookingTimeSlot,
    String? bookingEndTime,
  });
}

/// @nodoc
class __$$GuestModelImplCopyWithImpl<$Res>
    extends _$GuestModelCopyWithImpl<$Res, _$GuestModelImpl>
    implements _$$GuestModelImplCopyWith<$Res> {
  __$$GuestModelImplCopyWithImpl(
    _$GuestModelImpl _value,
    $Res Function(_$GuestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? visitCount = null,
    Object? visits = null,
    Object? isVIP = null,
    Object? lastVisit = null,
    Object? lastVisitGuestCount = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? notes = freezed,
    Object? lastVisitTableNumber = freezed,
    Object? currentTableId = freezed,
    Object? bookingId = freezed,
    Object? bookingTimeSlot = freezed,
    Object? bookingEndTime = freezed,
  }) {
    return _then(
      _$GuestModelImpl(
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
        visits: null == visits
            ? _value._visits
            : visits // ignore: cast_nullable_to_non_nullable
                  as List<VisitModel>,
        isVIP: null == isVIP
            ? _value.isVIP
            : isVIP // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastVisit: null == lastVisit
            ? _value.lastVisit
            : lastVisit // ignore: cast_nullable_to_non_nullable
                  as String,
        lastVisitGuestCount: null == lastVisitGuestCount
            ? _value.lastVisitGuestCount
            : lastVisitGuestCount // ignore: cast_nullable_to_non_nullable
                  as int,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastVisitTableNumber: freezed == lastVisitTableNumber
            ? _value.lastVisitTableNumber
            : lastVisitTableNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentTableId: freezed == currentTableId
            ? _value.currentTableId
            : currentTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingId: freezed == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingTimeSlot: freezed == bookingTimeSlot
            ? _value.bookingTimeSlot
            : bookingTimeSlot // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingEndTime: freezed == bookingEndTime
            ? _value.bookingEndTime
            : bookingEndTime // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestModelImpl implements _GuestModel {
  const _$GuestModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    required this.phone,
    required this.visitCount,
    @JsonKey(defaultValue: []) required final List<VisitModel> visits,
    required this.isVIP,
    required this.lastVisit,
    @JsonKey(defaultValue: 0) required this.lastVisitGuestCount,
    this.email,
    this.avatarUrl,
    this.notes,
    this.lastVisitTableNumber,
    this.currentTableId,
    this.bookingId,
    this.bookingTimeSlot,
    this.bookingEndTime,
  }) : _visits = visits;

  factory _$GuestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final int visitCount;
  final List<VisitModel> _visits;
  @override
  @JsonKey(defaultValue: [])
  List<VisitModel> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  @override
  final bool isVIP;
  @override
  final String lastVisit;
  @override
  @JsonKey(defaultValue: 0)
  final int lastVisitGuestCount;
  @override
  final String? email;
  @override
  final String? avatarUrl;
  @override
  final String? notes;
  @override
  final String? lastVisitTableNumber;
  @override
  final String? currentTableId;
  @override
  final String? bookingId;
  @override
  final String? bookingTimeSlot;
  @override
  final String? bookingEndTime;

  @override
  String toString() {
    return 'GuestModel(id: $id, name: $name, phone: $phone, visitCount: $visitCount, visits: $visits, isVIP: $isVIP, lastVisit: $lastVisit, lastVisitGuestCount: $lastVisitGuestCount, email: $email, avatarUrl: $avatarUrl, notes: $notes, lastVisitTableNumber: $lastVisitTableNumber, currentTableId: $currentTableId, bookingId: $bookingId, bookingTimeSlot: $bookingTimeSlot, bookingEndTime: $bookingEndTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            (identical(other.isVIP, isVIP) || other.isVIP == isVIP) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            (identical(other.lastVisitGuestCount, lastVisitGuestCount) ||
                other.lastVisitGuestCount == lastVisitGuestCount) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.lastVisitTableNumber, lastVisitTableNumber) ||
                other.lastVisitTableNumber == lastVisitTableNumber) &&
            (identical(other.currentTableId, currentTableId) ||
                other.currentTableId == currentTableId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingTimeSlot, bookingTimeSlot) ||
                other.bookingTimeSlot == bookingTimeSlot) &&
            (identical(other.bookingEndTime, bookingEndTime) ||
                other.bookingEndTime == bookingEndTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    visitCount,
    const DeepCollectionEquality().hash(_visits),
    isVIP,
    lastVisit,
    lastVisitGuestCount,
    email,
    avatarUrl,
    notes,
    lastVisitTableNumber,
    currentTableId,
    bookingId,
    bookingTimeSlot,
    bookingEndTime,
  );

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestModelImplCopyWith<_$GuestModelImpl> get copyWith =>
      __$$GuestModelImplCopyWithImpl<_$GuestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestModelImplToJson(this);
  }
}

abstract class _GuestModel implements GuestModel {
  const factory _GuestModel({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    required final String phone,
    required final int visitCount,
    @JsonKey(defaultValue: []) required final List<VisitModel> visits,
    required final bool isVIP,
    required final String lastVisit,
    @JsonKey(defaultValue: 0) required final int lastVisitGuestCount,
    final String? email,
    final String? avatarUrl,
    final String? notes,
    final String? lastVisitTableNumber,
    final String? currentTableId,
    final String? bookingId,
    final String? bookingTimeSlot,
    final String? bookingEndTime,
  }) = _$GuestModelImpl;

  factory _GuestModel.fromJson(Map<String, dynamic> json) =
      _$GuestModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  int get visitCount;
  @override
  @JsonKey(defaultValue: [])
  List<VisitModel> get visits;
  @override
  bool get isVIP;
  @override
  String get lastVisit;
  @override
  @JsonKey(defaultValue: 0)
  int get lastVisitGuestCount;
  @override
  String? get email;
  @override
  String? get avatarUrl;
  @override
  String? get notes;
  @override
  String? get lastVisitTableNumber;
  @override
  String? get currentTableId;
  @override
  String? get bookingId;
  @override
  String? get bookingTimeSlot;
  @override
  String? get bookingEndTime;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestModelImplCopyWith<_$GuestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
