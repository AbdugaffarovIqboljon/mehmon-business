// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TableInfoEntity {
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;

  /// Create a copy of TableInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableInfoEntityCopyWith<TableInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableInfoEntityCopyWith<$Res> {
  factory $TableInfoEntityCopyWith(
    TableInfoEntity value,
    $Res Function(TableInfoEntity) then,
  ) = _$TableInfoEntityCopyWithImpl<$Res, TableInfoEntity>;
  @useResult
  $Res call({String id, String number, int capacity});
}

/// @nodoc
class _$TableInfoEntityCopyWithImpl<$Res, $Val extends TableInfoEntity>
    implements $TableInfoEntityCopyWith<$Res> {
  _$TableInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? capacity = null,
  }) {
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
abstract class _$$TableInfoEntityImplCopyWith<$Res>
    implements $TableInfoEntityCopyWith<$Res> {
  factory _$$TableInfoEntityImplCopyWith(
    _$TableInfoEntityImpl value,
    $Res Function(_$TableInfoEntityImpl) then,
  ) = __$$TableInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String number, int capacity});
}

/// @nodoc
class __$$TableInfoEntityImplCopyWithImpl<$Res>
    extends _$TableInfoEntityCopyWithImpl<$Res, _$TableInfoEntityImpl>
    implements _$$TableInfoEntityImplCopyWith<$Res> {
  __$$TableInfoEntityImplCopyWithImpl(
    _$TableInfoEntityImpl _value,
    $Res Function(_$TableInfoEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? capacity = null,
  }) {
    return _then(
      _$TableInfoEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as String,
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TableInfoEntityImpl implements _TableInfoEntity {
  const _$TableInfoEntityImpl({
    required this.id,
    required this.number,
    required this.capacity,
  });

  @override
  final String id;
  @override
  final String number;
  @override
  final int capacity;

  @override
  String toString() {
    return 'TableInfoEntity(id: $id, number: $number, capacity: $capacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableInfoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, number, capacity);

  /// Create a copy of TableInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableInfoEntityImplCopyWith<_$TableInfoEntityImpl> get copyWith =>
      __$$TableInfoEntityImplCopyWithImpl<_$TableInfoEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _TableInfoEntity implements TableInfoEntity {
  const factory _TableInfoEntity({
    required final String id,
    required final String number,
    required final int capacity,
  }) = _$TableInfoEntityImpl;

  @override
  String get id;
  @override
  String get number;
  @override
  int get capacity;

  /// Create a copy of TableInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableInfoEntityImplCopyWith<_$TableInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  TableInfoEntity? get tableInfo => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get bookingType => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingEntityCopyWith<BookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEntityCopyWith<$Res> {
  factory $BookingEntityCopyWith(
    BookingEntity value,
    $Res Function(BookingEntity) then,
  ) = _$BookingEntityCopyWithImpl<$Res, BookingEntity>;
  @useResult
  $Res call({
    String id,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    TableInfoEntity? tableInfo,
    String? endTime,
    String? bookingType,
    String? notes,
  });

  $TableInfoEntityCopyWith<$Res>? get tableInfo;
}

/// @nodoc
class _$BookingEntityCopyWithImpl<$Res, $Val extends BookingEntity>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? phone = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
    Object? tableInfo = freezed,
    Object? endTime = freezed,
    Object? bookingType = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            timeSlot: null == timeSlot
                ? _value.timeSlot
                : timeSlot // ignore: cast_nullable_to_non_nullable
                      as String,
            numberOfGuests: null == numberOfGuests
                ? _value.numberOfGuests
                : numberOfGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            tableInfo: freezed == tableInfo
                ? _value.tableInfo
                : tableInfo // ignore: cast_nullable_to_non_nullable
                      as TableInfoEntity?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingType: freezed == bookingType
                ? _value.bookingType
                : bookingType // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableInfoEntityCopyWith<$Res>? get tableInfo {
    if (_value.tableInfo == null) {
      return null;
    }

    return $TableInfoEntityCopyWith<$Res>(_value.tableInfo!, (value) {
      return _then(_value.copyWith(tableInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingEntityImplCopyWith<$Res>
    implements $BookingEntityCopyWith<$Res> {
  factory _$$BookingEntityImplCopyWith(
    _$BookingEntityImpl value,
    $Res Function(_$BookingEntityImpl) then,
  ) = __$$BookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    TableInfoEntity? tableInfo,
    String? endTime,
    String? bookingType,
    String? notes,
  });

  @override
  $TableInfoEntityCopyWith<$Res>? get tableInfo;
}

/// @nodoc
class __$$BookingEntityImplCopyWithImpl<$Res>
    extends _$BookingEntityCopyWithImpl<$Res, _$BookingEntityImpl>
    implements _$$BookingEntityImplCopyWith<$Res> {
  __$$BookingEntityImplCopyWithImpl(
    _$BookingEntityImpl _value,
    $Res Function(_$BookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? phone = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
    Object? tableInfo = freezed,
    Object? endTime = freezed,
    Object? bookingType = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$BookingEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        timeSlot: null == timeSlot
            ? _value.timeSlot
            : timeSlot // ignore: cast_nullable_to_non_nullable
                  as String,
        numberOfGuests: null == numberOfGuests
            ? _value.numberOfGuests
            : numberOfGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        tableInfo: freezed == tableInfo
            ? _value.tableInfo
            : tableInfo // ignore: cast_nullable_to_non_nullable
                  as TableInfoEntity?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingType: freezed == bookingType
            ? _value.bookingType
            : bookingType // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BookingEntityImpl implements _BookingEntity {
  const _$BookingEntityImpl({
    required this.id,
    required this.guestName,
    required this.phone,
    required this.date,
    required this.timeSlot,
    required this.numberOfGuests,
    required this.status,
    required this.createdAt,
    this.tableInfo,
    this.endTime,
    this.bookingType,
    this.notes,
  });

  @override
  final String id;
  @override
  final String guestName;
  @override
  final String phone;
  @override
  final String date;
  @override
  final String timeSlot;
  @override
  final int numberOfGuests;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final TableInfoEntity? tableInfo;
  @override
  final String? endTime;
  @override
  final String? bookingType;
  @override
  final String? notes;

  @override
  String toString() {
    return 'BookingEntity(id: $id, guestName: $guestName, phone: $phone, date: $date, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, status: $status, createdAt: $createdAt, tableInfo: $tableInfo, endTime: $endTime, bookingType: $bookingType, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.tableInfo, tableInfo) ||
                other.tableInfo == tableInfo) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    guestName,
    phone,
    date,
    timeSlot,
    numberOfGuests,
    status,
    createdAt,
    tableInfo,
    endTime,
    bookingType,
    notes,
  );

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      __$$BookingEntityImplCopyWithImpl<_$BookingEntityImpl>(this, _$identity);
}

abstract class _BookingEntity implements BookingEntity {
  const factory _BookingEntity({
    required final String id,
    required final String guestName,
    required final String phone,
    required final String date,
    required final String timeSlot,
    required final int numberOfGuests,
    required final String status,
    required final String createdAt,
    final TableInfoEntity? tableInfo,
    final String? endTime,
    final String? bookingType,
    final String? notes,
  }) = _$BookingEntityImpl;

  @override
  String get id;
  @override
  String get guestName;
  @override
  String get phone;
  @override
  String get date;
  @override
  String get timeSlot;
  @override
  int get numberOfGuests;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  TableInfoEntity? get tableInfo;
  @override
  String? get endTime;
  @override
  String? get bookingType;
  @override
  String? get notes;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
