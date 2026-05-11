// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TableInfoModel _$TableInfoModelFromJson(Map<String, dynamic> json) {
  return _TableInfoModel.fromJson(json);
}

/// @nodoc
mixin _$TableInfoModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;

  /// Serializes this TableInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableInfoModelCopyWith<TableInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableInfoModelCopyWith<$Res> {
  factory $TableInfoModelCopyWith(
    TableInfoModel value,
    $Res Function(TableInfoModel) then,
  ) = _$TableInfoModelCopyWithImpl<$Res, TableInfoModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String number, int capacity});
}

/// @nodoc
class _$TableInfoModelCopyWithImpl<$Res, $Val extends TableInfoModel>
    implements $TableInfoModelCopyWith<$Res> {
  _$TableInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableInfoModel
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
abstract class _$$TableInfoModelImplCopyWith<$Res>
    implements $TableInfoModelCopyWith<$Res> {
  factory _$$TableInfoModelImplCopyWith(
    _$TableInfoModelImpl value,
    $Res Function(_$TableInfoModelImpl) then,
  ) = __$$TableInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String number, int capacity});
}

/// @nodoc
class __$$TableInfoModelImplCopyWithImpl<$Res>
    extends _$TableInfoModelCopyWithImpl<$Res, _$TableInfoModelImpl>
    implements _$$TableInfoModelImplCopyWith<$Res> {
  __$$TableInfoModelImplCopyWithImpl(
    _$TableInfoModelImpl _value,
    $Res Function(_$TableInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? capacity = null,
  }) {
    return _then(
      _$TableInfoModelImpl(
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
@JsonSerializable()
class _$TableInfoModelImpl implements _TableInfoModel {
  const _$TableInfoModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.number,
    required this.capacity,
  });

  factory _$TableInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableInfoModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String number;
  @override
  final int capacity;

  @override
  String toString() {
    return 'TableInfoModel(id: $id, number: $number, capacity: $capacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, capacity);

  /// Create a copy of TableInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableInfoModelImplCopyWith<_$TableInfoModelImpl> get copyWith =>
      __$$TableInfoModelImplCopyWithImpl<_$TableInfoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TableInfoModelImplToJson(this);
  }
}

abstract class _TableInfoModel implements TableInfoModel {
  const factory _TableInfoModel({
    @JsonKey(name: '_id') required final String id,
    required final String number,
    required final int capacity,
  }) = _$TableInfoModelImpl;

  factory _TableInfoModel.fromJson(Map<String, dynamic> json) =
      _$TableInfoModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get number;
  @override
  int get capacity;

  /// Create a copy of TableInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableInfoModelImplCopyWith<_$TableInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  TableInfoModel? get tableId => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
  BookingType? get bookingType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
    BookingModel value,
    $Res Function(BookingModel) then,
  ) = _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String createdAt,
    TableInfoModel? tableId,
    String? endTime,
    @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
    BookingType? bookingType,
    String status,
    String? notes,
  });

  $TableInfoModelCopyWith<$Res>? get tableId;
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingModel
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
    Object? createdAt = null,
    Object? tableId = freezed,
    Object? endTime = freezed,
    Object? bookingType = freezed,
    Object? status = null,
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
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            tableId: freezed == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
                      as TableInfoModel?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingType: freezed == bookingType
                ? _value.bookingType
                : bookingType // ignore: cast_nullable_to_non_nullable
                      as BookingType?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableInfoModelCopyWith<$Res>? get tableId {
    if (_value.tableId == null) {
      return null;
    }

    return $TableInfoModelCopyWith<$Res>(_value.tableId!, (value) {
      return _then(_value.copyWith(tableId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
    _$BookingModelImpl value,
    $Res Function(_$BookingModelImpl) then,
  ) = __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String createdAt,
    TableInfoModel? tableId,
    String? endTime,
    @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
    BookingType? bookingType,
    String status,
    String? notes,
  });

  @override
  $TableInfoModelCopyWith<$Res>? get tableId;
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
    _$BookingModelImpl _value,
    $Res Function(_$BookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingModel
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
    Object? createdAt = null,
    Object? tableId = freezed,
    Object? endTime = freezed,
    Object? bookingType = freezed,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$BookingModelImpl(
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
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        tableId: freezed == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as TableInfoModel?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingType: freezed == bookingType
            ? _value.bookingType
            : bookingType // ignore: cast_nullable_to_non_nullable
                  as BookingType?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.guestName,
    required this.phone,
    required this.date,
    required this.timeSlot,
    required this.numberOfGuests,
    required this.createdAt,
    this.tableId,
    this.endTime,
    @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
    this.bookingType,
    this.status = 'pending',
    this.notes,
  });

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
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
  final String createdAt;
  @override
  final TableInfoModel? tableId;
  @override
  final String? endTime;
  @override
  @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
  final BookingType? bookingType;
  @override
  @JsonKey()
  final String status;
  @override
  final String? notes;

  @override
  String toString() {
    return 'BookingModel(id: $id, guestName: $guestName, phone: $phone, date: $date, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, createdAt: $createdAt, tableId: $tableId, endTime: $endTime, bookingType: $bookingType, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    guestName,
    phone,
    date,
    timeSlot,
    numberOfGuests,
    createdAt,
    tableId,
    endTime,
    bookingType,
    status,
    notes,
  );

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(this);
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel({
    @JsonKey(name: '_id') required final String id,
    required final String guestName,
    required final String phone,
    required final String date,
    required final String timeSlot,
    required final int numberOfGuests,
    required final String createdAt,
    final TableInfoModel? tableId,
    final String? endTime,
    @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
    final BookingType? bookingType,
    final String status,
    final String? notes,
  }) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
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
  String get createdAt;
  @override
  TableInfoModel? get tableId;
  @override
  String? get endTime;
  @override
  @JsonKey(fromJson: _bookingTypeFromJson, toJson: _bookingTypeToJson)
  BookingType? get bookingType;
  @override
  String get status;
  @override
  String? get notes;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
