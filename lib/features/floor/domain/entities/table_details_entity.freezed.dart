// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SimpleTableEntity {
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String? get zone => throw _privateConstructorUsedError;

  /// Create a copy of SimpleTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleTableEntityCopyWith<SimpleTableEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTableEntityCopyWith<$Res> {
  factory $SimpleTableEntityCopyWith(
    SimpleTableEntity value,
    $Res Function(SimpleTableEntity) then,
  ) = _$SimpleTableEntityCopyWithImpl<$Res, SimpleTableEntity>;
  @useResult
  $Res call({String id, String number, int capacity, String? zone});
}

/// @nodoc
class _$SimpleTableEntityCopyWithImpl<$Res, $Val extends SimpleTableEntity>
    implements $SimpleTableEntityCopyWith<$Res> {
  _$SimpleTableEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleTableEntity
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
abstract class _$$SimpleTableEntityImplCopyWith<$Res>
    implements $SimpleTableEntityCopyWith<$Res> {
  factory _$$SimpleTableEntityImplCopyWith(
    _$SimpleTableEntityImpl value,
    $Res Function(_$SimpleTableEntityImpl) then,
  ) = __$$SimpleTableEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String number, int capacity, String? zone});
}

/// @nodoc
class __$$SimpleTableEntityImplCopyWithImpl<$Res>
    extends _$SimpleTableEntityCopyWithImpl<$Res, _$SimpleTableEntityImpl>
    implements _$$SimpleTableEntityImplCopyWith<$Res> {
  __$$SimpleTableEntityImplCopyWithImpl(
    _$SimpleTableEntityImpl _value,
    $Res Function(_$SimpleTableEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleTableEntity
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
      _$SimpleTableEntityImpl(
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

class _$SimpleTableEntityImpl implements _SimpleTableEntity {
  const _$SimpleTableEntityImpl({
    required this.id,
    required this.number,
    required this.capacity,
    this.zone,
  });

  @override
  final String id;
  @override
  final String number;
  @override
  final int capacity;
  @override
  final String? zone;

  @override
  String toString() {
    return 'SimpleTableEntity(id: $id, number: $number, capacity: $capacity, zone: $zone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleTableEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.zone, zone) || other.zone == zone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, number, capacity, zone);

  /// Create a copy of SimpleTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTableEntityImplCopyWith<_$SimpleTableEntityImpl> get copyWith =>
      __$$SimpleTableEntityImplCopyWithImpl<_$SimpleTableEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _SimpleTableEntity implements SimpleTableEntity {
  const factory _SimpleTableEntity({
    required final String id,
    required final String number,
    required final int capacity,
    final String? zone,
  }) = _$SimpleTableEntityImpl;

  @override
  String get id;
  @override
  String get number;
  @override
  int get capacity;
  @override
  String? get zone;

  /// Create a copy of SimpleTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleTableEntityImplCopyWith<_$SimpleTableEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableCurrentBookingEntity {
  String get guestName => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of TableCurrentBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableCurrentBookingEntityCopyWith<TableCurrentBookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableCurrentBookingEntityCopyWith<$Res> {
  factory $TableCurrentBookingEntityCopyWith(
    TableCurrentBookingEntity value,
    $Res Function(TableCurrentBookingEntity) then,
  ) = _$TableCurrentBookingEntityCopyWithImpl<$Res, TableCurrentBookingEntity>;
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
class _$TableCurrentBookingEntityCopyWithImpl<
  $Res,
  $Val extends TableCurrentBookingEntity
>
    implements $TableCurrentBookingEntityCopyWith<$Res> {
  _$TableCurrentBookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableCurrentBookingEntity
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
abstract class _$$TableCurrentBookingEntityImplCopyWith<$Res>
    implements $TableCurrentBookingEntityCopyWith<$Res> {
  factory _$$TableCurrentBookingEntityImplCopyWith(
    _$TableCurrentBookingEntityImpl value,
    $Res Function(_$TableCurrentBookingEntityImpl) then,
  ) = __$$TableCurrentBookingEntityImplCopyWithImpl<$Res>;
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
class __$$TableCurrentBookingEntityImplCopyWithImpl<$Res>
    extends
        _$TableCurrentBookingEntityCopyWithImpl<
          $Res,
          _$TableCurrentBookingEntityImpl
        >
    implements _$$TableCurrentBookingEntityImplCopyWith<$Res> {
  __$$TableCurrentBookingEntityImplCopyWithImpl(
    _$TableCurrentBookingEntityImpl _value,
    $Res Function(_$TableCurrentBookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableCurrentBookingEntity
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
      _$TableCurrentBookingEntityImpl(
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

class _$TableCurrentBookingEntityImpl implements _TableCurrentBookingEntity {
  const _$TableCurrentBookingEntityImpl({
    required this.guestName,
    required this.timeSlot,
    required this.numberOfGuests,
    this.endTime,
    this.notes,
  });

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
    return 'TableCurrentBookingEntity(guestName: $guestName, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, endTime: $endTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableCurrentBookingEntityImpl &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    guestName,
    timeSlot,
    numberOfGuests,
    endTime,
    notes,
  );

  /// Create a copy of TableCurrentBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableCurrentBookingEntityImplCopyWith<_$TableCurrentBookingEntityImpl>
  get copyWith =>
      __$$TableCurrentBookingEntityImplCopyWithImpl<
        _$TableCurrentBookingEntityImpl
      >(this, _$identity);
}

abstract class _TableCurrentBookingEntity implements TableCurrentBookingEntity {
  const factory _TableCurrentBookingEntity({
    required final String guestName,
    required final String timeSlot,
    required final int numberOfGuests,
    final String? endTime,
    final String? notes,
  }) = _$TableCurrentBookingEntityImpl;

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

  /// Create a copy of TableCurrentBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableCurrentBookingEntityImplCopyWith<_$TableCurrentBookingEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableUpcomingBookingEntity {
  String get guestName => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;

  /// Create a copy of TableUpcomingBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableUpcomingBookingEntityCopyWith<TableUpcomingBookingEntity>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableUpcomingBookingEntityCopyWith<$Res> {
  factory $TableUpcomingBookingEntityCopyWith(
    TableUpcomingBookingEntity value,
    $Res Function(TableUpcomingBookingEntity) then,
  ) =
      _$TableUpcomingBookingEntityCopyWithImpl<
        $Res,
        TableUpcomingBookingEntity
      >;
  @useResult
  $Res call({String guestName, String timeSlot, int numberOfGuests});
}

/// @nodoc
class _$TableUpcomingBookingEntityCopyWithImpl<
  $Res,
  $Val extends TableUpcomingBookingEntity
>
    implements $TableUpcomingBookingEntityCopyWith<$Res> {
  _$TableUpcomingBookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableUpcomingBookingEntity
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
abstract class _$$TableUpcomingBookingEntityImplCopyWith<$Res>
    implements $TableUpcomingBookingEntityCopyWith<$Res> {
  factory _$$TableUpcomingBookingEntityImplCopyWith(
    _$TableUpcomingBookingEntityImpl value,
    $Res Function(_$TableUpcomingBookingEntityImpl) then,
  ) = __$$TableUpcomingBookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guestName, String timeSlot, int numberOfGuests});
}

/// @nodoc
class __$$TableUpcomingBookingEntityImplCopyWithImpl<$Res>
    extends
        _$TableUpcomingBookingEntityCopyWithImpl<
          $Res,
          _$TableUpcomingBookingEntityImpl
        >
    implements _$$TableUpcomingBookingEntityImplCopyWith<$Res> {
  __$$TableUpcomingBookingEntityImplCopyWithImpl(
    _$TableUpcomingBookingEntityImpl _value,
    $Res Function(_$TableUpcomingBookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableUpcomingBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestName = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
  }) {
    return _then(
      _$TableUpcomingBookingEntityImpl(
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

class _$TableUpcomingBookingEntityImpl implements _TableUpcomingBookingEntity {
  const _$TableUpcomingBookingEntityImpl({
    required this.guestName,
    required this.timeSlot,
    required this.numberOfGuests,
  });

  @override
  final String guestName;
  @override
  final String timeSlot;
  @override
  final int numberOfGuests;

  @override
  String toString() {
    return 'TableUpcomingBookingEntity(guestName: $guestName, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableUpcomingBookingEntityImpl &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, guestName, timeSlot, numberOfGuests);

  /// Create a copy of TableUpcomingBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableUpcomingBookingEntityImplCopyWith<_$TableUpcomingBookingEntityImpl>
  get copyWith =>
      __$$TableUpcomingBookingEntityImplCopyWithImpl<
        _$TableUpcomingBookingEntityImpl
      >(this, _$identity);
}

abstract class _TableUpcomingBookingEntity
    implements TableUpcomingBookingEntity {
  const factory _TableUpcomingBookingEntity({
    required final String guestName,
    required final String timeSlot,
    required final int numberOfGuests,
  }) = _$TableUpcomingBookingEntityImpl;

  @override
  String get guestName;
  @override
  String get timeSlot;
  @override
  int get numberOfGuests;

  /// Create a copy of TableUpcomingBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableUpcomingBookingEntityImplCopyWith<_$TableUpcomingBookingEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableDetailsEntity {
  SimpleTableEntity get table => throw _privateConstructorUsedError;
  TableCurrentBookingEntity? get currentBooking =>
      throw _privateConstructorUsedError;
  List<TableUpcomingBookingEntity> get upcomingBookings =>
      throw _privateConstructorUsedError;

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableDetailsEntityCopyWith<TableDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableDetailsEntityCopyWith<$Res> {
  factory $TableDetailsEntityCopyWith(
    TableDetailsEntity value,
    $Res Function(TableDetailsEntity) then,
  ) = _$TableDetailsEntityCopyWithImpl<$Res, TableDetailsEntity>;
  @useResult
  $Res call({
    SimpleTableEntity table,
    TableCurrentBookingEntity? currentBooking,
    List<TableUpcomingBookingEntity> upcomingBookings,
  });

  $SimpleTableEntityCopyWith<$Res> get table;
  $TableCurrentBookingEntityCopyWith<$Res>? get currentBooking;
}

/// @nodoc
class _$TableDetailsEntityCopyWithImpl<$Res, $Val extends TableDetailsEntity>
    implements $TableDetailsEntityCopyWith<$Res> {
  _$TableDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableDetailsEntity
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
                      as SimpleTableEntity,
            currentBooking: freezed == currentBooking
                ? _value.currentBooking
                : currentBooking // ignore: cast_nullable_to_non_nullable
                      as TableCurrentBookingEntity?,
            upcomingBookings: null == upcomingBookings
                ? _value.upcomingBookings
                : upcomingBookings // ignore: cast_nullable_to_non_nullable
                      as List<TableUpcomingBookingEntity>,
          )
          as $Val,
    );
  }

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleTableEntityCopyWith<$Res> get table {
    return $SimpleTableEntityCopyWith<$Res>(_value.table, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableCurrentBookingEntityCopyWith<$Res>? get currentBooking {
    if (_value.currentBooking == null) {
      return null;
    }

    return $TableCurrentBookingEntityCopyWith<$Res>(_value.currentBooking!, (
      value,
    ) {
      return _then(_value.copyWith(currentBooking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TableDetailsEntityImplCopyWith<$Res>
    implements $TableDetailsEntityCopyWith<$Res> {
  factory _$$TableDetailsEntityImplCopyWith(
    _$TableDetailsEntityImpl value,
    $Res Function(_$TableDetailsEntityImpl) then,
  ) = __$$TableDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SimpleTableEntity table,
    TableCurrentBookingEntity? currentBooking,
    List<TableUpcomingBookingEntity> upcomingBookings,
  });

  @override
  $SimpleTableEntityCopyWith<$Res> get table;
  @override
  $TableCurrentBookingEntityCopyWith<$Res>? get currentBooking;
}

/// @nodoc
class __$$TableDetailsEntityImplCopyWithImpl<$Res>
    extends _$TableDetailsEntityCopyWithImpl<$Res, _$TableDetailsEntityImpl>
    implements _$$TableDetailsEntityImplCopyWith<$Res> {
  __$$TableDetailsEntityImplCopyWithImpl(
    _$TableDetailsEntityImpl _value,
    $Res Function(_$TableDetailsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? currentBooking = freezed,
    Object? upcomingBookings = null,
  }) {
    return _then(
      _$TableDetailsEntityImpl(
        table: null == table
            ? _value.table
            : table // ignore: cast_nullable_to_non_nullable
                  as SimpleTableEntity,
        currentBooking: freezed == currentBooking
            ? _value.currentBooking
            : currentBooking // ignore: cast_nullable_to_non_nullable
                  as TableCurrentBookingEntity?,
        upcomingBookings: null == upcomingBookings
            ? _value._upcomingBookings
            : upcomingBookings // ignore: cast_nullable_to_non_nullable
                  as List<TableUpcomingBookingEntity>,
      ),
    );
  }
}

/// @nodoc

class _$TableDetailsEntityImpl implements _TableDetailsEntity {
  const _$TableDetailsEntityImpl({
    required this.table,
    this.currentBooking,
    final List<TableUpcomingBookingEntity> upcomingBookings = const [],
  }) : _upcomingBookings = upcomingBookings;

  @override
  final SimpleTableEntity table;
  @override
  final TableCurrentBookingEntity? currentBooking;
  final List<TableUpcomingBookingEntity> _upcomingBookings;
  @override
  @JsonKey()
  List<TableUpcomingBookingEntity> get upcomingBookings {
    if (_upcomingBookings is EqualUnmodifiableListView)
      return _upcomingBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingBookings);
  }

  @override
  String toString() {
    return 'TableDetailsEntity(table: $table, currentBooking: $currentBooking, upcomingBookings: $upcomingBookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableDetailsEntityImpl &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.currentBooking, currentBooking) ||
                other.currentBooking == currentBooking) &&
            const DeepCollectionEquality().equals(
              other._upcomingBookings,
              _upcomingBookings,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    currentBooking,
    const DeepCollectionEquality().hash(_upcomingBookings),
  );

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableDetailsEntityImplCopyWith<_$TableDetailsEntityImpl> get copyWith =>
      __$$TableDetailsEntityImplCopyWithImpl<_$TableDetailsEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _TableDetailsEntity implements TableDetailsEntity {
  const factory _TableDetailsEntity({
    required final SimpleTableEntity table,
    final TableCurrentBookingEntity? currentBooking,
    final List<TableUpcomingBookingEntity> upcomingBookings,
  }) = _$TableDetailsEntityImpl;

  @override
  SimpleTableEntity get table;
  @override
  TableCurrentBookingEntity? get currentBooking;
  @override
  List<TableUpcomingBookingEntity> get upcomingBookings;

  /// Create a copy of TableDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableDetailsEntityImplCopyWith<_$TableDetailsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
