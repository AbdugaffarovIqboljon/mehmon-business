// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SimpleTableModel _$SimpleTableModelFromJson(Map<String, dynamic> json) {
  return _SimpleTableModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleTableModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String? get zone => throw _privateConstructorUsedError;

  /// Serializes this SimpleTableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleTableModelCopyWith<SimpleTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTableModelCopyWith<$Res> {
  factory $SimpleTableModelCopyWith(
    SimpleTableModel value,
    $Res Function(SimpleTableModel) then,
  ) = _$SimpleTableModelCopyWithImpl<$Res, SimpleTableModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String number,
    int capacity,
    String? zone,
  });
}

/// @nodoc
class _$SimpleTableModelCopyWithImpl<$Res, $Val extends SimpleTableModel>
    implements $SimpleTableModelCopyWith<$Res> {
  _$SimpleTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? capacity = null,
    Object? zone = freezed,
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
            zone: freezed == zone
                ? _value.zone
                : zone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleTableModelImplCopyWith<$Res>
    implements $SimpleTableModelCopyWith<$Res> {
  factory _$$SimpleTableModelImplCopyWith(
    _$SimpleTableModelImpl value,
    $Res Function(_$SimpleTableModelImpl) then,
  ) = __$$SimpleTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String number,
    int capacity,
    String? zone,
  });
}

/// @nodoc
class __$$SimpleTableModelImplCopyWithImpl<$Res>
    extends _$SimpleTableModelCopyWithImpl<$Res, _$SimpleTableModelImpl>
    implements _$$SimpleTableModelImplCopyWith<$Res> {
  __$$SimpleTableModelImplCopyWithImpl(
    _$SimpleTableModelImpl _value,
    $Res Function(_$SimpleTableModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? capacity = null,
    Object? zone = freezed,
  }) {
    return _then(
      _$SimpleTableModelImpl(
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
        zone: freezed == zone
            ? _value.zone
            : zone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleTableModelImpl implements _SimpleTableModel {
  const _$SimpleTableModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.number,
    required this.capacity,
    this.zone,
  });

  factory _$SimpleTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleTableModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String number;
  @override
  final int capacity;
  @override
  final String? zone;

  @override
  String toString() {
    return 'SimpleTableModel(id: $id, number: $number, capacity: $capacity, zone: $zone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleTableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.zone, zone) || other.zone == zone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, capacity, zone);

  /// Create a copy of SimpleTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTableModelImplCopyWith<_$SimpleTableModelImpl> get copyWith =>
      __$$SimpleTableModelImplCopyWithImpl<_$SimpleTableModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleTableModelImplToJson(this);
  }
}

abstract class _SimpleTableModel implements SimpleTableModel {
  const factory _SimpleTableModel({
    @JsonKey(name: '_id') required final String id,
    required final String number,
    required final int capacity,
    final String? zone,
  }) = _$SimpleTableModelImpl;

  factory _SimpleTableModel.fromJson(Map<String, dynamic> json) =
      _$SimpleTableModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get number;
  @override
  int get capacity;
  @override
  String? get zone;

  /// Create a copy of SimpleTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleTableModelImplCopyWith<_$SimpleTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TableCurrentBookingModel _$TableCurrentBookingModelFromJson(
  Map<String, dynamic> json,
) {
  return _TableCurrentBookingModel.fromJson(json);
}

/// @nodoc
mixin _$TableCurrentBookingModel {
  String get guestName => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TableCurrentBookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableCurrentBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableCurrentBookingModelCopyWith<TableCurrentBookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableCurrentBookingModelCopyWith<$Res> {
  factory $TableCurrentBookingModelCopyWith(
    TableCurrentBookingModel value,
    $Res Function(TableCurrentBookingModel) then,
  ) = _$TableCurrentBookingModelCopyWithImpl<$Res, TableCurrentBookingModel>;
  @useResult
  $Res call({
    String guestName,
    String timeSlot,
    int numberOfGuests,
    String? endTime,
    String? notes,
  });
}

/// @nodoc
class _$TableCurrentBookingModelCopyWithImpl<
  $Res,
  $Val extends TableCurrentBookingModel
>
    implements $TableCurrentBookingModelCopyWith<$Res> {
  _$TableCurrentBookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableCurrentBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestName = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? endTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            timeSlot: null == timeSlot
                ? _value.timeSlot
                : timeSlot // ignore: cast_nullable_to_non_nullable
                      as String,
            numberOfGuests: null == numberOfGuests
                ? _value.numberOfGuests
                : numberOfGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$TableCurrentBookingModelImplCopyWith<$Res>
    implements $TableCurrentBookingModelCopyWith<$Res> {
  factory _$$TableCurrentBookingModelImplCopyWith(
    _$TableCurrentBookingModelImpl value,
    $Res Function(_$TableCurrentBookingModelImpl) then,
  ) = __$$TableCurrentBookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String guestName,
    String timeSlot,
    int numberOfGuests,
    String? endTime,
    String? notes,
  });
}

/// @nodoc
class __$$TableCurrentBookingModelImplCopyWithImpl<$Res>
    extends
        _$TableCurrentBookingModelCopyWithImpl<
          $Res,
          _$TableCurrentBookingModelImpl
        >
    implements _$$TableCurrentBookingModelImplCopyWith<$Res> {
  __$$TableCurrentBookingModelImplCopyWithImpl(
    _$TableCurrentBookingModelImpl _value,
    $Res Function(_$TableCurrentBookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableCurrentBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestName = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? endTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$TableCurrentBookingModelImpl(
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        timeSlot: null == timeSlot
            ? _value.timeSlot
            : timeSlot // ignore: cast_nullable_to_non_nullable
                  as String,
        numberOfGuests: null == numberOfGuests
            ? _value.numberOfGuests
            : numberOfGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$TableCurrentBookingModelImpl implements _TableCurrentBookingModel {
  const _$TableCurrentBookingModelImpl({
    required this.guestName,
    required this.timeSlot,
    required this.numberOfGuests,
    this.endTime,
    this.notes,
  });

  factory _$TableCurrentBookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableCurrentBookingModelImplFromJson(json);

  @override
  final String guestName;
  @override
  final String timeSlot;
  @override
  final int numberOfGuests;
  @override
  final String? endTime;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TableCurrentBookingModel(guestName: $guestName, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, endTime: $endTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableCurrentBookingModelImpl &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    guestName,
    timeSlot,
    numberOfGuests,
    endTime,
    notes,
  );

  /// Create a copy of TableCurrentBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableCurrentBookingModelImplCopyWith<_$TableCurrentBookingModelImpl>
  get copyWith =>
      __$$TableCurrentBookingModelImplCopyWithImpl<
        _$TableCurrentBookingModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableCurrentBookingModelImplToJson(this);
  }
}

abstract class _TableCurrentBookingModel implements TableCurrentBookingModel {
  const factory _TableCurrentBookingModel({
    required final String guestName,
    required final String timeSlot,
    required final int numberOfGuests,
    final String? endTime,
    final String? notes,
  }) = _$TableCurrentBookingModelImpl;

  factory _TableCurrentBookingModel.fromJson(Map<String, dynamic> json) =
      _$TableCurrentBookingModelImpl.fromJson;

  @override
  String get guestName;
  @override
  String get timeSlot;
  @override
  int get numberOfGuests;
  @override
  String? get endTime;
  @override
  String? get notes;

  /// Create a copy of TableCurrentBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableCurrentBookingModelImplCopyWith<_$TableCurrentBookingModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TableUpcomingBookingModel _$TableUpcomingBookingModelFromJson(
  Map<String, dynamic> json,
) {
  return _TableUpcomingBookingModel.fromJson(json);
}

/// @nodoc
mixin _$TableUpcomingBookingModel {
  String get guestName => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;

  /// Serializes this TableUpcomingBookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableUpcomingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableUpcomingBookingModelCopyWith<TableUpcomingBookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableUpcomingBookingModelCopyWith<$Res> {
  factory $TableUpcomingBookingModelCopyWith(
    TableUpcomingBookingModel value,
    $Res Function(TableUpcomingBookingModel) then,
  ) = _$TableUpcomingBookingModelCopyWithImpl<$Res, TableUpcomingBookingModel>;
  @useResult
  $Res call({String guestName, String timeSlot, int numberOfGuests});
}

/// @nodoc
class _$TableUpcomingBookingModelCopyWithImpl<
  $Res,
  $Val extends TableUpcomingBookingModel
>
    implements $TableUpcomingBookingModelCopyWith<$Res> {
  _$TableUpcomingBookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableUpcomingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestName = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
  }) {
    return _then(
      _value.copyWith(
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            timeSlot: null == timeSlot
                ? _value.timeSlot
                : timeSlot // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TableUpcomingBookingModelImplCopyWith<$Res>
    implements $TableUpcomingBookingModelCopyWith<$Res> {
  factory _$$TableUpcomingBookingModelImplCopyWith(
    _$TableUpcomingBookingModelImpl value,
    $Res Function(_$TableUpcomingBookingModelImpl) then,
  ) = __$$TableUpcomingBookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guestName, String timeSlot, int numberOfGuests});
}

/// @nodoc
class __$$TableUpcomingBookingModelImplCopyWithImpl<$Res>
    extends
        _$TableUpcomingBookingModelCopyWithImpl<
          $Res,
          _$TableUpcomingBookingModelImpl
        >
    implements _$$TableUpcomingBookingModelImplCopyWith<$Res> {
  __$$TableUpcomingBookingModelImplCopyWithImpl(
    _$TableUpcomingBookingModelImpl _value,
    $Res Function(_$TableUpcomingBookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableUpcomingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestName = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
  }) {
    return _then(
      _$TableUpcomingBookingModelImpl(
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        timeSlot: null == timeSlot
            ? _value.timeSlot
            : timeSlot // ignore: cast_nullable_to_non_nullable
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
class _$TableUpcomingBookingModelImpl implements _TableUpcomingBookingModel {
  const _$TableUpcomingBookingModelImpl({
    required this.guestName,
    required this.timeSlot,
    required this.numberOfGuests,
  });

  factory _$TableUpcomingBookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableUpcomingBookingModelImplFromJson(json);

  @override
  final String guestName;
  @override
  final String timeSlot;
  @override
  final int numberOfGuests;

  @override
  String toString() {
    return 'TableUpcomingBookingModel(guestName: $guestName, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableUpcomingBookingModelImpl &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, guestName, timeSlot, numberOfGuests);

  /// Create a copy of TableUpcomingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableUpcomingBookingModelImplCopyWith<_$TableUpcomingBookingModelImpl>
  get copyWith =>
      __$$TableUpcomingBookingModelImplCopyWithImpl<
        _$TableUpcomingBookingModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableUpcomingBookingModelImplToJson(this);
  }
}

abstract class _TableUpcomingBookingModel implements TableUpcomingBookingModel {
  const factory _TableUpcomingBookingModel({
    required final String guestName,
    required final String timeSlot,
    required final int numberOfGuests,
  }) = _$TableUpcomingBookingModelImpl;

  factory _TableUpcomingBookingModel.fromJson(Map<String, dynamic> json) =
      _$TableUpcomingBookingModelImpl.fromJson;

  @override
  String get guestName;
  @override
  String get timeSlot;
  @override
  int get numberOfGuests;

  /// Create a copy of TableUpcomingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableUpcomingBookingModelImplCopyWith<_$TableUpcomingBookingModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TableDetailsModel _$TableDetailsModelFromJson(Map<String, dynamic> json) {
  return _TableDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$TableDetailsModel {
  SimpleTableModel get table => throw _privateConstructorUsedError;
  TableCurrentBookingModel? get currentBooking =>
      throw _privateConstructorUsedError;
  List<TableUpcomingBookingModel> get upcomingBookings =>
      throw _privateConstructorUsedError;

  /// Serializes this TableDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableDetailsModelCopyWith<TableDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableDetailsModelCopyWith<$Res> {
  factory $TableDetailsModelCopyWith(
    TableDetailsModel value,
    $Res Function(TableDetailsModel) then,
  ) = _$TableDetailsModelCopyWithImpl<$Res, TableDetailsModel>;
  @useResult
  $Res call({
    SimpleTableModel table,
    TableCurrentBookingModel? currentBooking,
    List<TableUpcomingBookingModel> upcomingBookings,
  });

  $SimpleTableModelCopyWith<$Res> get table;
  $TableCurrentBookingModelCopyWith<$Res>? get currentBooking;
}

/// @nodoc
class _$TableDetailsModelCopyWithImpl<$Res, $Val extends TableDetailsModel>
    implements $TableDetailsModelCopyWith<$Res> {
  _$TableDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? currentBooking = freezed,
    Object? upcomingBookings = null,
  }) {
    return _then(
      _value.copyWith(
            table: null == table
                ? _value.table
                : table // ignore: cast_nullable_to_non_nullable
                      as SimpleTableModel,
            currentBooking: freezed == currentBooking
                ? _value.currentBooking
                : currentBooking // ignore: cast_nullable_to_non_nullable
                      as TableCurrentBookingModel?,
            upcomingBookings: null == upcomingBookings
                ? _value.upcomingBookings
                : upcomingBookings // ignore: cast_nullable_to_non_nullable
                      as List<TableUpcomingBookingModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleTableModelCopyWith<$Res> get table {
    return $SimpleTableModelCopyWith<$Res>(_value.table, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableCurrentBookingModelCopyWith<$Res>? get currentBooking {
    if (_value.currentBooking == null) {
      return null;
    }

    return $TableCurrentBookingModelCopyWith<$Res>(_value.currentBooking!, (
      value,
    ) {
      return _then(_value.copyWith(currentBooking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TableDetailsModelImplCopyWith<$Res>
    implements $TableDetailsModelCopyWith<$Res> {
  factory _$$TableDetailsModelImplCopyWith(
    _$TableDetailsModelImpl value,
    $Res Function(_$TableDetailsModelImpl) then,
  ) = __$$TableDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SimpleTableModel table,
    TableCurrentBookingModel? currentBooking,
    List<TableUpcomingBookingModel> upcomingBookings,
  });

  @override
  $SimpleTableModelCopyWith<$Res> get table;
  @override
  $TableCurrentBookingModelCopyWith<$Res>? get currentBooking;
}

/// @nodoc
class __$$TableDetailsModelImplCopyWithImpl<$Res>
    extends _$TableDetailsModelCopyWithImpl<$Res, _$TableDetailsModelImpl>
    implements _$$TableDetailsModelImplCopyWith<$Res> {
  __$$TableDetailsModelImplCopyWithImpl(
    _$TableDetailsModelImpl _value,
    $Res Function(_$TableDetailsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? currentBooking = freezed,
    Object? upcomingBookings = null,
  }) {
    return _then(
      _$TableDetailsModelImpl(
        table: null == table
            ? _value.table
            : table // ignore: cast_nullable_to_non_nullable
                  as SimpleTableModel,
        currentBooking: freezed == currentBooking
            ? _value.currentBooking
            : currentBooking // ignore: cast_nullable_to_non_nullable
                  as TableCurrentBookingModel?,
        upcomingBookings: null == upcomingBookings
            ? _value._upcomingBookings
            : upcomingBookings // ignore: cast_nullable_to_non_nullable
                  as List<TableUpcomingBookingModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TableDetailsModelImpl implements _TableDetailsModel {
  const _$TableDetailsModelImpl({
    required this.table,
    this.currentBooking,
    final List<TableUpcomingBookingModel> upcomingBookings = const [],
  }) : _upcomingBookings = upcomingBookings;

  factory _$TableDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableDetailsModelImplFromJson(json);

  @override
  final SimpleTableModel table;
  @override
  final TableCurrentBookingModel? currentBooking;
  final List<TableUpcomingBookingModel> _upcomingBookings;
  @override
  @JsonKey()
  List<TableUpcomingBookingModel> get upcomingBookings {
    if (_upcomingBookings is EqualUnmodifiableListView)
      return _upcomingBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingBookings);
  }

  @override
  String toString() {
    return 'TableDetailsModel(table: $table, currentBooking: $currentBooking, upcomingBookings: $upcomingBookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableDetailsModelImpl &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.currentBooking, currentBooking) ||
                other.currentBooking == currentBooking) &&
            const DeepCollectionEquality().equals(
              other._upcomingBookings,
              _upcomingBookings,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    currentBooking,
    const DeepCollectionEquality().hash(_upcomingBookings),
  );

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableDetailsModelImplCopyWith<_$TableDetailsModelImpl> get copyWith =>
      __$$TableDetailsModelImplCopyWithImpl<_$TableDetailsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TableDetailsModelImplToJson(this);
  }
}

abstract class _TableDetailsModel implements TableDetailsModel {
  const factory _TableDetailsModel({
    required final SimpleTableModel table,
    final TableCurrentBookingModel? currentBooking,
    final List<TableUpcomingBookingModel> upcomingBookings,
  }) = _$TableDetailsModelImpl;

  factory _TableDetailsModel.fromJson(Map<String, dynamic> json) =
      _$TableDetailsModelImpl.fromJson;

  @override
  SimpleTableModel get table;
  @override
  TableCurrentBookingModel? get currentBooking;
  @override
  List<TableUpcomingBookingModel> get upcomingBookings;

  /// Create a copy of TableDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableDetailsModelImplCopyWith<_$TableDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
