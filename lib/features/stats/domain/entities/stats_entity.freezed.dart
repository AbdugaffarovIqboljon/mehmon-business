// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AnalyticsPeriodEntity {
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsPeriodEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsPeriodEntityCopyWith<AnalyticsPeriodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsPeriodEntityCopyWith<$Res> {
  factory $AnalyticsPeriodEntityCopyWith(
    AnalyticsPeriodEntity value,
    $Res Function(AnalyticsPeriodEntity) then,
  ) = _$AnalyticsPeriodEntityCopyWithImpl<$Res, AnalyticsPeriodEntity>;
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class _$AnalyticsPeriodEntityCopyWithImpl<
  $Res,
  $Val extends AnalyticsPeriodEntity
>
    implements $AnalyticsPeriodEntityCopyWith<$Res> {
  _$AnalyticsPeriodEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsPeriodEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? startDate = null, Object? endDate = null}) {
    return _then(
      _value.copyWith(
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalyticsPeriodEntityImplCopyWith<$Res>
    implements $AnalyticsPeriodEntityCopyWith<$Res> {
  factory _$$AnalyticsPeriodEntityImplCopyWith(
    _$AnalyticsPeriodEntityImpl value,
    $Res Function(_$AnalyticsPeriodEntityImpl) then,
  ) = __$$AnalyticsPeriodEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class __$$AnalyticsPeriodEntityImplCopyWithImpl<$Res>
    extends
        _$AnalyticsPeriodEntityCopyWithImpl<$Res, _$AnalyticsPeriodEntityImpl>
    implements _$$AnalyticsPeriodEntityImplCopyWith<$Res> {
  __$$AnalyticsPeriodEntityImplCopyWithImpl(
    _$AnalyticsPeriodEntityImpl _value,
    $Res Function(_$AnalyticsPeriodEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsPeriodEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? startDate = null, Object? endDate = null}) {
    return _then(
      _$AnalyticsPeriodEntityImpl(
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AnalyticsPeriodEntityImpl implements _AnalyticsPeriodEntity {
  const _$AnalyticsPeriodEntityImpl({
    required this.startDate,
    required this.endDate,
  });

  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'AnalyticsPeriodEntity(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsPeriodEntityImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of AnalyticsPeriodEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsPeriodEntityImplCopyWith<_$AnalyticsPeriodEntityImpl>
  get copyWith =>
      __$$AnalyticsPeriodEntityImplCopyWithImpl<_$AnalyticsPeriodEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _AnalyticsPeriodEntity implements AnalyticsPeriodEntity {
  const factory _AnalyticsPeriodEntity({
    required final String startDate,
    required final String endDate,
  }) = _$AnalyticsPeriodEntityImpl;

  @override
  String get startDate;
  @override
  String get endDate;

  /// Create a copy of AnalyticsPeriodEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsPeriodEntityImplCopyWith<_$AnalyticsPeriodEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnalyticsSummaryEntity {
  int get totalBookings => throw _privateConstructorUsedError;
  int get confirmedBookings => throw _privateConstructorUsedError;
  int get pendingBookings => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  int get totalTables => throw _privateConstructorUsedError;
  double get occupancyRate => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsSummaryEntityCopyWith<AnalyticsSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsSummaryEntityCopyWith<$Res> {
  factory $AnalyticsSummaryEntityCopyWith(
    AnalyticsSummaryEntity value,
    $Res Function(AnalyticsSummaryEntity) then,
  ) = _$AnalyticsSummaryEntityCopyWithImpl<$Res, AnalyticsSummaryEntity>;
  @useResult
  $Res call({
    int totalBookings,
    int confirmedBookings,
    int pendingBookings,
    int totalGuests,
    int totalTables,
    double occupancyRate,
  });
}

/// @nodoc
class _$AnalyticsSummaryEntityCopyWithImpl<
  $Res,
  $Val extends AnalyticsSummaryEntity
>
    implements $AnalyticsSummaryEntityCopyWith<$Res> {
  _$AnalyticsSummaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? confirmedBookings = null,
    Object? pendingBookings = null,
    Object? totalGuests = null,
    Object? totalTables = null,
    Object? occupancyRate = null,
  }) {
    return _then(
      _value.copyWith(
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            confirmedBookings: null == confirmedBookings
                ? _value.confirmedBookings
                : confirmedBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingBookings: null == pendingBookings
                ? _value.pendingBookings
                : pendingBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            totalGuests: null == totalGuests
                ? _value.totalGuests
                : totalGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            totalTables: null == totalTables
                ? _value.totalTables
                : totalTables // ignore: cast_nullable_to_non_nullable
                      as int,
            occupancyRate: null == occupancyRate
                ? _value.occupancyRate
                : occupancyRate // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalyticsSummaryEntityImplCopyWith<$Res>
    implements $AnalyticsSummaryEntityCopyWith<$Res> {
  factory _$$AnalyticsSummaryEntityImplCopyWith(
    _$AnalyticsSummaryEntityImpl value,
    $Res Function(_$AnalyticsSummaryEntityImpl) then,
  ) = __$$AnalyticsSummaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalBookings,
    int confirmedBookings,
    int pendingBookings,
    int totalGuests,
    int totalTables,
    double occupancyRate,
  });
}

/// @nodoc
class __$$AnalyticsSummaryEntityImplCopyWithImpl<$Res>
    extends
        _$AnalyticsSummaryEntityCopyWithImpl<$Res, _$AnalyticsSummaryEntityImpl>
    implements _$$AnalyticsSummaryEntityImplCopyWith<$Res> {
  __$$AnalyticsSummaryEntityImplCopyWithImpl(
    _$AnalyticsSummaryEntityImpl _value,
    $Res Function(_$AnalyticsSummaryEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? confirmedBookings = null,
    Object? pendingBookings = null,
    Object? totalGuests = null,
    Object? totalTables = null,
    Object? occupancyRate = null,
  }) {
    return _then(
      _$AnalyticsSummaryEntityImpl(
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        confirmedBookings: null == confirmedBookings
            ? _value.confirmedBookings
            : confirmedBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingBookings: null == pendingBookings
            ? _value.pendingBookings
            : pendingBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        totalGuests: null == totalGuests
            ? _value.totalGuests
            : totalGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTables: null == totalTables
            ? _value.totalTables
            : totalTables // ignore: cast_nullable_to_non_nullable
                  as int,
        occupancyRate: null == occupancyRate
            ? _value.occupancyRate
            : occupancyRate // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$AnalyticsSummaryEntityImpl implements _AnalyticsSummaryEntity {
  const _$AnalyticsSummaryEntityImpl({
    required this.totalBookings,
    required this.confirmedBookings,
    required this.pendingBookings,
    required this.totalGuests,
    required this.totalTables,
    required this.occupancyRate,
  });

  @override
  final int totalBookings;
  @override
  final int confirmedBookings;
  @override
  final int pendingBookings;
  @override
  final int totalGuests;
  @override
  final int totalTables;
  @override
  final double occupancyRate;

  @override
  String toString() {
    return 'AnalyticsSummaryEntity(totalBookings: $totalBookings, confirmedBookings: $confirmedBookings, pendingBookings: $pendingBookings, totalGuests: $totalGuests, totalTables: $totalTables, occupancyRate: $occupancyRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsSummaryEntityImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.confirmedBookings, confirmedBookings) ||
                other.confirmedBookings == confirmedBookings) &&
            (identical(other.pendingBookings, pendingBookings) ||
                other.pendingBookings == pendingBookings) &&
            (identical(other.totalGuests, totalGuests) ||
                other.totalGuests == totalGuests) &&
            (identical(other.totalTables, totalTables) ||
                other.totalTables == totalTables) &&
            (identical(other.occupancyRate, occupancyRate) ||
                other.occupancyRate == occupancyRate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBookings,
    confirmedBookings,
    pendingBookings,
    totalGuests,
    totalTables,
    occupancyRate,
  );

  /// Create a copy of AnalyticsSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsSummaryEntityImplCopyWith<_$AnalyticsSummaryEntityImpl>
  get copyWith =>
      __$$AnalyticsSummaryEntityImplCopyWithImpl<_$AnalyticsSummaryEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _AnalyticsSummaryEntity implements AnalyticsSummaryEntity {
  const factory _AnalyticsSummaryEntity({
    required final int totalBookings,
    required final int confirmedBookings,
    required final int pendingBookings,
    required final int totalGuests,
    required final int totalTables,
    required final double occupancyRate,
  }) = _$AnalyticsSummaryEntityImpl;

  @override
  int get totalBookings;
  @override
  int get confirmedBookings;
  @override
  int get pendingBookings;
  @override
  int get totalGuests;
  @override
  int get totalTables;
  @override
  double get occupancyRate;

  /// Create a copy of AnalyticsSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsSummaryEntityImplCopyWith<_$AnalyticsSummaryEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportBookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get bookingType => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  TableInfoEntity? get tableId => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportBookingEntityCopyWith<ReportBookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportBookingEntityCopyWith<$Res> {
  factory $ReportBookingEntityCopyWith(
    ReportBookingEntity value,
    $Res Function(ReportBookingEntity) then,
  ) = _$ReportBookingEntityCopyWithImpl<$Res, ReportBookingEntity>;
  @useResult
  $Res call({
    String id,
    String bookingType,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    TableInfoEntity? tableId,
    String? endTime,
    String? notes,
  });

  $TableInfoEntityCopyWith<$Res>? get tableId;
}

/// @nodoc
class _$ReportBookingEntityCopyWithImpl<$Res, $Val extends ReportBookingEntity>
    implements $ReportBookingEntityCopyWith<$Res> {
  _$ReportBookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingType = null,
    Object? guestName = null,
    Object? phone = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
    Object? tableId = freezed,
    Object? endTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            bookingType: null == bookingType
                ? _value.bookingType
                : bookingType // ignore: cast_nullable_to_non_nullable
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
            tableId: freezed == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
                      as TableInfoEntity?,
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

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableInfoEntityCopyWith<$Res>? get tableId {
    if (_value.tableId == null) {
      return null;
    }

    return $TableInfoEntityCopyWith<$Res>(_value.tableId!, (value) {
      return _then(_value.copyWith(tableId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportBookingEntityImplCopyWith<$Res>
    implements $ReportBookingEntityCopyWith<$Res> {
  factory _$$ReportBookingEntityImplCopyWith(
    _$ReportBookingEntityImpl value,
    $Res Function(_$ReportBookingEntityImpl) then,
  ) = __$$ReportBookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String bookingType,
    String guestName,
    String phone,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    TableInfoEntity? tableId,
    String? endTime,
    String? notes,
  });

  @override
  $TableInfoEntityCopyWith<$Res>? get tableId;
}

/// @nodoc
class __$$ReportBookingEntityImplCopyWithImpl<$Res>
    extends _$ReportBookingEntityCopyWithImpl<$Res, _$ReportBookingEntityImpl>
    implements _$$ReportBookingEntityImplCopyWith<$Res> {
  __$$ReportBookingEntityImplCopyWithImpl(
    _$ReportBookingEntityImpl _value,
    $Res Function(_$ReportBookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingType = null,
    Object? guestName = null,
    Object? phone = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
    Object? tableId = freezed,
    Object? endTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$ReportBookingEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bookingType: null == bookingType
            ? _value.bookingType
            : bookingType // ignore: cast_nullable_to_non_nullable
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
        tableId: freezed == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as TableInfoEntity?,
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

class _$ReportBookingEntityImpl implements _ReportBookingEntity {
  const _$ReportBookingEntityImpl({
    required this.id,
    required this.bookingType,
    required this.guestName,
    required this.phone,
    required this.date,
    required this.timeSlot,
    required this.numberOfGuests,
    required this.status,
    required this.createdAt,
    this.tableId,
    this.endTime,
    this.notes,
  });

  @override
  final String id;
  @override
  final String bookingType;
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
  final TableInfoEntity? tableId;
  @override
  final String? endTime;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ReportBookingEntity(id: $id, bookingType: $bookingType, guestName: $guestName, phone: $phone, date: $date, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, status: $status, createdAt: $createdAt, tableId: $tableId, endTime: $endTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportBookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
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
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bookingType,
    guestName,
    phone,
    date,
    timeSlot,
    numberOfGuests,
    status,
    createdAt,
    tableId,
    endTime,
    notes,
  );

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportBookingEntityImplCopyWith<_$ReportBookingEntityImpl> get copyWith =>
      __$$ReportBookingEntityImplCopyWithImpl<_$ReportBookingEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _ReportBookingEntity implements ReportBookingEntity {
  const factory _ReportBookingEntity({
    required final String id,
    required final String bookingType,
    required final String guestName,
    required final String phone,
    required final String date,
    required final String timeSlot,
    required final int numberOfGuests,
    required final String status,
    required final String createdAt,
    final TableInfoEntity? tableId,
    final String? endTime,
    final String? notes,
  }) = _$ReportBookingEntityImpl;

  @override
  String get id;
  @override
  String get bookingType;
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
  TableInfoEntity? get tableId;
  @override
  String? get endTime;
  @override
  String? get notes;

  /// Create a copy of ReportBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportBookingEntityImplCopyWith<_$ReportBookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnalyticsReportEntity {
  AnalyticsPeriodEntity get period => throw _privateConstructorUsedError;
  int get totalBookings => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  List<ReportBookingEntity> get bookings => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsReportEntityCopyWith<AnalyticsReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsReportEntityCopyWith<$Res> {
  factory $AnalyticsReportEntityCopyWith(
    AnalyticsReportEntity value,
    $Res Function(AnalyticsReportEntity) then,
  ) = _$AnalyticsReportEntityCopyWithImpl<$Res, AnalyticsReportEntity>;
  @useResult
  $Res call({
    AnalyticsPeriodEntity period,
    int totalBookings,
    int completed,
    int cancelled,
    int totalGuests,
    List<ReportBookingEntity> bookings,
  });

  $AnalyticsPeriodEntityCopyWith<$Res> get period;
}

/// @nodoc
class _$AnalyticsReportEntityCopyWithImpl<
  $Res,
  $Val extends AnalyticsReportEntity
>
    implements $AnalyticsReportEntityCopyWith<$Res> {
  _$AnalyticsReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalBookings = null,
    Object? completed = null,
    Object? cancelled = null,
    Object? totalGuests = null,
    Object? bookings = null,
  }) {
    return _then(
      _value.copyWith(
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as AnalyticsPeriodEntity,
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as int,
            cancelled: null == cancelled
                ? _value.cancelled
                : cancelled // ignore: cast_nullable_to_non_nullable
                      as int,
            totalGuests: null == totalGuests
                ? _value.totalGuests
                : totalGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            bookings: null == bookings
                ? _value.bookings
                : bookings // ignore: cast_nullable_to_non_nullable
                      as List<ReportBookingEntity>,
          )
          as $Val,
    );
  }

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodEntityCopyWith<$Res> get period {
    return $AnalyticsPeriodEntityCopyWith<$Res>(_value.period, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsReportEntityImplCopyWith<$Res>
    implements $AnalyticsReportEntityCopyWith<$Res> {
  factory _$$AnalyticsReportEntityImplCopyWith(
    _$AnalyticsReportEntityImpl value,
    $Res Function(_$AnalyticsReportEntityImpl) then,
  ) = __$$AnalyticsReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AnalyticsPeriodEntity period,
    int totalBookings,
    int completed,
    int cancelled,
    int totalGuests,
    List<ReportBookingEntity> bookings,
  });

  @override
  $AnalyticsPeriodEntityCopyWith<$Res> get period;
}

/// @nodoc
class __$$AnalyticsReportEntityImplCopyWithImpl<$Res>
    extends
        _$AnalyticsReportEntityCopyWithImpl<$Res, _$AnalyticsReportEntityImpl>
    implements _$$AnalyticsReportEntityImplCopyWith<$Res> {
  __$$AnalyticsReportEntityImplCopyWithImpl(
    _$AnalyticsReportEntityImpl _value,
    $Res Function(_$AnalyticsReportEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalBookings = null,
    Object? completed = null,
    Object? cancelled = null,
    Object? totalGuests = null,
    Object? bookings = null,
  }) {
    return _then(
      _$AnalyticsReportEntityImpl(
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as AnalyticsPeriodEntity,
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
        cancelled: null == cancelled
            ? _value.cancelled
            : cancelled // ignore: cast_nullable_to_non_nullable
                  as int,
        totalGuests: null == totalGuests
            ? _value.totalGuests
            : totalGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        bookings: null == bookings
            ? _value._bookings
            : bookings // ignore: cast_nullable_to_non_nullable
                  as List<ReportBookingEntity>,
      ),
    );
  }
}

/// @nodoc

class _$AnalyticsReportEntityImpl implements _AnalyticsReportEntity {
  const _$AnalyticsReportEntityImpl({
    required this.period,
    required this.totalBookings,
    required this.completed,
    required this.cancelled,
    required this.totalGuests,
    final List<ReportBookingEntity> bookings = const [],
  }) : _bookings = bookings;

  @override
  final AnalyticsPeriodEntity period;
  @override
  final int totalBookings;
  @override
  final int completed;
  @override
  final int cancelled;
  @override
  final int totalGuests;
  final List<ReportBookingEntity> _bookings;
  @override
  @JsonKey()
  List<ReportBookingEntity> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'AnalyticsReportEntity(period: $period, totalBookings: $totalBookings, completed: $completed, cancelled: $cancelled, totalGuests: $totalGuests, bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsReportEntityImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled) &&
            (identical(other.totalGuests, totalGuests) ||
                other.totalGuests == totalGuests) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    period,
    totalBookings,
    completed,
    cancelled,
    totalGuests,
    const DeepCollectionEquality().hash(_bookings),
  );

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsReportEntityImplCopyWith<_$AnalyticsReportEntityImpl>
  get copyWith =>
      __$$AnalyticsReportEntityImplCopyWithImpl<_$AnalyticsReportEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _AnalyticsReportEntity implements AnalyticsReportEntity {
  const factory _AnalyticsReportEntity({
    required final AnalyticsPeriodEntity period,
    required final int totalBookings,
    required final int completed,
    required final int cancelled,
    required final int totalGuests,
    final List<ReportBookingEntity> bookings,
  }) = _$AnalyticsReportEntityImpl;

  @override
  AnalyticsPeriodEntity get period;
  @override
  int get totalBookings;
  @override
  int get completed;
  @override
  int get cancelled;
  @override
  int get totalGuests;
  @override
  List<ReportBookingEntity> get bookings;

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsReportEntityImplCopyWith<_$AnalyticsReportEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
