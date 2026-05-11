// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalyticsPeriodModel _$AnalyticsPeriodModelFromJson(Map<String, dynamic> json) {
  return _AnalyticsPeriodModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsPeriodModel {
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsPeriodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsPeriodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsPeriodModelCopyWith<AnalyticsPeriodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsPeriodModelCopyWith<$Res> {
  factory $AnalyticsPeriodModelCopyWith(
    AnalyticsPeriodModel value,
    $Res Function(AnalyticsPeriodModel) then,
  ) = _$AnalyticsPeriodModelCopyWithImpl<$Res, AnalyticsPeriodModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
  });
}

/// @nodoc
class _$AnalyticsPeriodModelCopyWithImpl<
  $Res,
  $Val extends AnalyticsPeriodModel
>
    implements $AnalyticsPeriodModelCopyWith<$Res> {
  _$AnalyticsPeriodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsPeriodModel
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
abstract class _$$AnalyticsPeriodModelImplCopyWith<$Res>
    implements $AnalyticsPeriodModelCopyWith<$Res> {
  factory _$$AnalyticsPeriodModelImplCopyWith(
    _$AnalyticsPeriodModelImpl value,
    $Res Function(_$AnalyticsPeriodModelImpl) then,
  ) = __$$AnalyticsPeriodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
  });
}

/// @nodoc
class __$$AnalyticsPeriodModelImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodModelCopyWithImpl<$Res, _$AnalyticsPeriodModelImpl>
    implements _$$AnalyticsPeriodModelImplCopyWith<$Res> {
  __$$AnalyticsPeriodModelImplCopyWithImpl(
    _$AnalyticsPeriodModelImpl _value,
    $Res Function(_$AnalyticsPeriodModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsPeriodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? startDate = null, Object? endDate = null}) {
    return _then(
      _$AnalyticsPeriodModelImpl(
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
@JsonSerializable()
class _$AnalyticsPeriodModelImpl implements _AnalyticsPeriodModel {
  const _$AnalyticsPeriodModelImpl({
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') required this.endDate,
  });

  factory _$AnalyticsPeriodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsPeriodModelImplFromJson(json);

  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;

  @override
  String toString() {
    return 'AnalyticsPeriodModel(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsPeriodModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of AnalyticsPeriodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsPeriodModelImplCopyWith<_$AnalyticsPeriodModelImpl>
  get copyWith =>
      __$$AnalyticsPeriodModelImplCopyWithImpl<_$AnalyticsPeriodModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsPeriodModelImplToJson(this);
  }
}

abstract class _AnalyticsPeriodModel implements AnalyticsPeriodModel {
  const factory _AnalyticsPeriodModel({
    @JsonKey(name: 'start_date') required final String startDate,
    @JsonKey(name: 'end_date') required final String endDate,
  }) = _$AnalyticsPeriodModelImpl;

  factory _AnalyticsPeriodModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsPeriodModelImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;

  /// Create a copy of AnalyticsPeriodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsPeriodModelImplCopyWith<_$AnalyticsPeriodModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AnalyticsSummaryModel _$AnalyticsSummaryModelFromJson(
  Map<String, dynamic> json,
) {
  return _AnalyticsSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsSummaryModel {
  @JsonKey(name: 'total_bookings')
  int get totalBookings => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_bookings')
  int get confirmedBookings => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_bookings')
  int get pendingBookings => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_guests')
  int get totalGuests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tables')
  int get totalTables => throw _privateConstructorUsedError;
  @JsonKey(name: 'occupancy_rate')
  double get occupancyRate => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsSummaryModelCopyWith<AnalyticsSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsSummaryModelCopyWith<$Res> {
  factory $AnalyticsSummaryModelCopyWith(
    AnalyticsSummaryModel value,
    $Res Function(AnalyticsSummaryModel) then,
  ) = _$AnalyticsSummaryModelCopyWithImpl<$Res, AnalyticsSummaryModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_bookings') int totalBookings,
    @JsonKey(name: 'confirmed_bookings') int confirmedBookings,
    @JsonKey(name: 'pending_bookings') int pendingBookings,
    @JsonKey(name: 'total_guests') int totalGuests,
    @JsonKey(name: 'total_tables') int totalTables,
    @JsonKey(name: 'occupancy_rate') double occupancyRate,
  });
}

/// @nodoc
class _$AnalyticsSummaryModelCopyWithImpl<
  $Res,
  $Val extends AnalyticsSummaryModel
>
    implements $AnalyticsSummaryModelCopyWith<$Res> {
  _$AnalyticsSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsSummaryModel
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
abstract class _$$AnalyticsSummaryModelImplCopyWith<$Res>
    implements $AnalyticsSummaryModelCopyWith<$Res> {
  factory _$$AnalyticsSummaryModelImplCopyWith(
    _$AnalyticsSummaryModelImpl value,
    $Res Function(_$AnalyticsSummaryModelImpl) then,
  ) = __$$AnalyticsSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_bookings') int totalBookings,
    @JsonKey(name: 'confirmed_bookings') int confirmedBookings,
    @JsonKey(name: 'pending_bookings') int pendingBookings,
    @JsonKey(name: 'total_guests') int totalGuests,
    @JsonKey(name: 'total_tables') int totalTables,
    @JsonKey(name: 'occupancy_rate') double occupancyRate,
  });
}

/// @nodoc
class __$$AnalyticsSummaryModelImplCopyWithImpl<$Res>
    extends
        _$AnalyticsSummaryModelCopyWithImpl<$Res, _$AnalyticsSummaryModelImpl>
    implements _$$AnalyticsSummaryModelImplCopyWith<$Res> {
  __$$AnalyticsSummaryModelImplCopyWithImpl(
    _$AnalyticsSummaryModelImpl _value,
    $Res Function(_$AnalyticsSummaryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsSummaryModel
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
      _$AnalyticsSummaryModelImpl(
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
@JsonSerializable()
class _$AnalyticsSummaryModelImpl implements _AnalyticsSummaryModel {
  const _$AnalyticsSummaryModelImpl({
    @JsonKey(name: 'total_bookings') required this.totalBookings,
    @JsonKey(name: 'confirmed_bookings') required this.confirmedBookings,
    @JsonKey(name: 'pending_bookings') required this.pendingBookings,
    @JsonKey(name: 'total_guests') required this.totalGuests,
    @JsonKey(name: 'total_tables') required this.totalTables,
    @JsonKey(name: 'occupancy_rate') required this.occupancyRate,
  });

  factory _$AnalyticsSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsSummaryModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_bookings')
  final int totalBookings;
  @override
  @JsonKey(name: 'confirmed_bookings')
  final int confirmedBookings;
  @override
  @JsonKey(name: 'pending_bookings')
  final int pendingBookings;
  @override
  @JsonKey(name: 'total_guests')
  final int totalGuests;
  @override
  @JsonKey(name: 'total_tables')
  final int totalTables;
  @override
  @JsonKey(name: 'occupancy_rate')
  final double occupancyRate;

  @override
  String toString() {
    return 'AnalyticsSummaryModel(totalBookings: $totalBookings, confirmedBookings: $confirmedBookings, pendingBookings: $pendingBookings, totalGuests: $totalGuests, totalTables: $totalTables, occupancyRate: $occupancyRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsSummaryModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of AnalyticsSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsSummaryModelImplCopyWith<_$AnalyticsSummaryModelImpl>
  get copyWith =>
      __$$AnalyticsSummaryModelImplCopyWithImpl<_$AnalyticsSummaryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsSummaryModelImplToJson(this);
  }
}

abstract class _AnalyticsSummaryModel implements AnalyticsSummaryModel {
  const factory _AnalyticsSummaryModel({
    @JsonKey(name: 'total_bookings') required final int totalBookings,
    @JsonKey(name: 'confirmed_bookings') required final int confirmedBookings,
    @JsonKey(name: 'pending_bookings') required final int pendingBookings,
    @JsonKey(name: 'total_guests') required final int totalGuests,
    @JsonKey(name: 'total_tables') required final int totalTables,
    @JsonKey(name: 'occupancy_rate') required final double occupancyRate,
  }) = _$AnalyticsSummaryModelImpl;

  factory _AnalyticsSummaryModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsSummaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_bookings')
  int get totalBookings;
  @override
  @JsonKey(name: 'confirmed_bookings')
  int get confirmedBookings;
  @override
  @JsonKey(name: 'pending_bookings')
  int get pendingBookings;
  @override
  @JsonKey(name: 'total_guests')
  int get totalGuests;
  @override
  @JsonKey(name: 'total_tables')
  int get totalTables;
  @override
  @JsonKey(name: 'occupancy_rate')
  double get occupancyRate;

  /// Create a copy of AnalyticsSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsSummaryModelImplCopyWith<_$AnalyticsSummaryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AnalyticsReportModel _$AnalyticsReportModelFromJson(Map<String, dynamic> json) {
  return _AnalyticsReportModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsReportModel {
  AnalyticsPeriodModel get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_bookings')
  int get totalBookings => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_guests')
  int get totalGuests => throw _privateConstructorUsedError;
  List<dynamic> get bookings => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsReportModelCopyWith<AnalyticsReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsReportModelCopyWith<$Res> {
  factory $AnalyticsReportModelCopyWith(
    AnalyticsReportModel value,
    $Res Function(AnalyticsReportModel) then,
  ) = _$AnalyticsReportModelCopyWithImpl<$Res, AnalyticsReportModel>;
  @useResult
  $Res call({
    AnalyticsPeriodModel period,
    @JsonKey(name: 'total_bookings') int totalBookings,
    int completed,
    int cancelled,
    @JsonKey(name: 'total_guests') int totalGuests,
    List<dynamic> bookings,
  });

  $AnalyticsPeriodModelCopyWith<$Res> get period;
}

/// @nodoc
class _$AnalyticsReportModelCopyWithImpl<
  $Res,
  $Val extends AnalyticsReportModel
>
    implements $AnalyticsReportModelCopyWith<$Res> {
  _$AnalyticsReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsReportModel
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
                      as AnalyticsPeriodModel,
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
                      as List<dynamic>,
          )
          as $Val,
    );
  }

  /// Create a copy of AnalyticsReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodModelCopyWith<$Res> get period {
    return $AnalyticsPeriodModelCopyWith<$Res>(_value.period, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsReportModelImplCopyWith<$Res>
    implements $AnalyticsReportModelCopyWith<$Res> {
  factory _$$AnalyticsReportModelImplCopyWith(
    _$AnalyticsReportModelImpl value,
    $Res Function(_$AnalyticsReportModelImpl) then,
  ) = __$$AnalyticsReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AnalyticsPeriodModel period,
    @JsonKey(name: 'total_bookings') int totalBookings,
    int completed,
    int cancelled,
    @JsonKey(name: 'total_guests') int totalGuests,
    List<dynamic> bookings,
  });

  @override
  $AnalyticsPeriodModelCopyWith<$Res> get period;
}

/// @nodoc
class __$$AnalyticsReportModelImplCopyWithImpl<$Res>
    extends _$AnalyticsReportModelCopyWithImpl<$Res, _$AnalyticsReportModelImpl>
    implements _$$AnalyticsReportModelImplCopyWith<$Res> {
  __$$AnalyticsReportModelImplCopyWithImpl(
    _$AnalyticsReportModelImpl _value,
    $Res Function(_$AnalyticsReportModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsReportModel
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
      _$AnalyticsReportModelImpl(
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as AnalyticsPeriodModel,
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
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsReportModelImpl implements _AnalyticsReportModel {
  const _$AnalyticsReportModelImpl({
    required this.period,
    @JsonKey(name: 'total_bookings') required this.totalBookings,
    required this.completed,
    required this.cancelled,
    @JsonKey(name: 'total_guests') required this.totalGuests,
    final List<dynamic> bookings = const [],
  }) : _bookings = bookings;

  factory _$AnalyticsReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsReportModelImplFromJson(json);

  @override
  final AnalyticsPeriodModel period;
  @override
  @JsonKey(name: 'total_bookings')
  final int totalBookings;
  @override
  final int completed;
  @override
  final int cancelled;
  @override
  @JsonKey(name: 'total_guests')
  final int totalGuests;
  final List<dynamic> _bookings;
  @override
  @JsonKey()
  List<dynamic> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'AnalyticsReportModel(period: $period, totalBookings: $totalBookings, completed: $completed, cancelled: $cancelled, totalGuests: $totalGuests, bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsReportModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of AnalyticsReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsReportModelImplCopyWith<_$AnalyticsReportModelImpl>
  get copyWith =>
      __$$AnalyticsReportModelImplCopyWithImpl<_$AnalyticsReportModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsReportModelImplToJson(this);
  }
}

abstract class _AnalyticsReportModel implements AnalyticsReportModel {
  const factory _AnalyticsReportModel({
    required final AnalyticsPeriodModel period,
    @JsonKey(name: 'total_bookings') required final int totalBookings,
    required final int completed,
    required final int cancelled,
    @JsonKey(name: 'total_guests') required final int totalGuests,
    final List<dynamic> bookings,
  }) = _$AnalyticsReportModelImpl;

  factory _AnalyticsReportModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsReportModelImpl.fromJson;

  @override
  AnalyticsPeriodModel get period;
  @override
  @JsonKey(name: 'total_bookings')
  int get totalBookings;
  @override
  int get completed;
  @override
  int get cancelled;
  @override
  @JsonKey(name: 'total_guests')
  int get totalGuests;
  @override
  List<dynamic> get bookings;

  /// Create a copy of AnalyticsReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsReportModelImplCopyWith<_$AnalyticsReportModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
