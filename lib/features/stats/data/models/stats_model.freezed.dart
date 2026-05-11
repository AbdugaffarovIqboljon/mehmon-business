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
  String get startDate => throw _privateConstructorUsedError;
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
  $Res call({String startDate, String endDate});
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
  $Res call({String startDate, String endDate});
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
    required this.startDate,
    required this.endDate,
  });

  factory _$AnalyticsPeriodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsPeriodModelImplFromJson(json);

  @override
  final String startDate;
  @override
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
    required final String startDate,
    required final String endDate,
  }) = _$AnalyticsPeriodModelImpl;

  factory _AnalyticsPeriodModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsPeriodModelImpl.fromJson;

  @override
  String get startDate;
  @override
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
  int get totalBookings => throw _privateConstructorUsedError;
  int get confirmedBookings => throw _privateConstructorUsedError;
  int get pendingBookings => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  int get totalTables => throw _privateConstructorUsedError;
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
    int totalBookings,
    int confirmedBookings,
    int pendingBookings,
    int totalGuests,
    int totalTables,
    double occupancyRate,
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
    int totalBookings,
    int confirmedBookings,
    int pendingBookings,
    int totalGuests,
    int totalTables,
    double occupancyRate,
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
    required this.totalBookings,
    required this.confirmedBookings,
    required this.pendingBookings,
    required this.totalGuests,
    required this.totalTables,
    required this.occupancyRate,
  });

  factory _$AnalyticsSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsSummaryModelImplFromJson(json);

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
    required final int totalBookings,
    required final int confirmedBookings,
    required final int pendingBookings,
    required final int totalGuests,
    required final int totalTables,
    required final double occupancyRate,
  }) = _$AnalyticsSummaryModelImpl;

  factory _AnalyticsSummaryModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsSummaryModelImpl.fromJson;

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
  int get totalBookings => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  List<ReportBookingModel> get bookings => throw _privateConstructorUsedError;

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
    int totalBookings,
    int completed,
    int cancelled,
    int totalGuests,
    List<ReportBookingModel> bookings,
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
                      as List<ReportBookingModel>,
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
    int totalBookings,
    int completed,
    int cancelled,
    int totalGuests,
    List<ReportBookingModel> bookings,
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
                  as List<ReportBookingModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsReportModelImpl implements _AnalyticsReportModel {
  const _$AnalyticsReportModelImpl({
    required this.period,
    required this.totalBookings,
    required this.completed,
    required this.cancelled,
    required this.totalGuests,
    final List<ReportBookingModel> bookings = const [],
  }) : _bookings = bookings;

  factory _$AnalyticsReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsReportModelImplFromJson(json);

  @override
  final AnalyticsPeriodModel period;
  @override
  final int totalBookings;
  @override
  final int completed;
  @override
  final int cancelled;
  @override
  final int totalGuests;
  final List<ReportBookingModel> _bookings;
  @override
  @JsonKey()
  List<ReportBookingModel> get bookings {
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
    required final int totalBookings,
    required final int completed,
    required final int cancelled,
    required final int totalGuests,
    final List<ReportBookingModel> bookings,
  }) = _$AnalyticsReportModelImpl;

  factory _AnalyticsReportModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsReportModelImpl.fromJson;

  @override
  AnalyticsPeriodModel get period;
  @override
  int get totalBookings;
  @override
  int get completed;
  @override
  int get cancelled;
  @override
  int get totalGuests;
  @override
  List<ReportBookingModel> get bookings;

  /// Create a copy of AnalyticsReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsReportModelImplCopyWith<_$AnalyticsReportModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReportBookingModel _$ReportBookingModelFromJson(Map<String, dynamic> json) {
  return _ReportBookingModel.fromJson(json);
}

/// @nodoc
mixin _$ReportBookingModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get bookingType => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get tableId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get timeSlot => throw _privateConstructorUsedError;
  int get numberOfGuests => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ReportBookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportBookingModelCopyWith<ReportBookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportBookingModelCopyWith<$Res> {
  factory $ReportBookingModelCopyWith(
    ReportBookingModel value,
    $Res Function(ReportBookingModel) then,
  ) = _$ReportBookingModelCopyWithImpl<$Res, ReportBookingModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String bookingType,
    String guestName,
    String phone,
    String tableId,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    String? endTime,
    String? notes,
  });
}

/// @nodoc
class _$ReportBookingModelCopyWithImpl<$Res, $Val extends ReportBookingModel>
    implements $ReportBookingModelCopyWith<$Res> {
  _$ReportBookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingType = null,
    Object? guestName = null,
    Object? phone = null,
    Object? tableId = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
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
            tableId: null == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReportBookingModelImplCopyWith<$Res>
    implements $ReportBookingModelCopyWith<$Res> {
  factory _$$ReportBookingModelImplCopyWith(
    _$ReportBookingModelImpl value,
    $Res Function(_$ReportBookingModelImpl) then,
  ) = __$$ReportBookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String bookingType,
    String guestName,
    String phone,
    String tableId,
    String date,
    String timeSlot,
    int numberOfGuests,
    String status,
    String createdAt,
    String? endTime,
    String? notes,
  });
}

/// @nodoc
class __$$ReportBookingModelImplCopyWithImpl<$Res>
    extends _$ReportBookingModelCopyWithImpl<$Res, _$ReportBookingModelImpl>
    implements _$$ReportBookingModelImplCopyWith<$Res> {
  __$$ReportBookingModelImplCopyWithImpl(
    _$ReportBookingModelImpl _value,
    $Res Function(_$ReportBookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingType = null,
    Object? guestName = null,
    Object? phone = null,
    Object? tableId = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? numberOfGuests = null,
    Object? status = null,
    Object? createdAt = null,
    Object? endTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$ReportBookingModelImpl(
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
        tableId: null == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
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
class _$ReportBookingModelImpl extends _ReportBookingModel {
  const _$ReportBookingModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.bookingType,
    required this.guestName,
    required this.phone,
    required this.tableId,
    required this.date,
    required this.timeSlot,
    required this.numberOfGuests,
    required this.status,
    required this.createdAt,
    this.endTime,
    this.notes,
  }) : super._();

  factory _$ReportBookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportBookingModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String bookingType;
  @override
  final String guestName;
  @override
  final String phone;
  @override
  final String tableId;
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
  final String? endTime;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ReportBookingModel(id: $id, bookingType: $bookingType, guestName: $guestName, phone: $phone, tableId: $tableId, date: $date, timeSlot: $timeSlot, numberOfGuests: $numberOfGuests, status: $status, createdAt: $createdAt, endTime: $endTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportBookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bookingType,
    guestName,
    phone,
    tableId,
    date,
    timeSlot,
    numberOfGuests,
    status,
    createdAt,
    endTime,
    notes,
  );

  /// Create a copy of ReportBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportBookingModelImplCopyWith<_$ReportBookingModelImpl> get copyWith =>
      __$$ReportBookingModelImplCopyWithImpl<_$ReportBookingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportBookingModelImplToJson(this);
  }
}

abstract class _ReportBookingModel extends ReportBookingModel {
  const factory _ReportBookingModel({
    @JsonKey(name: '_id') required final String id,
    required final String bookingType,
    required final String guestName,
    required final String phone,
    required final String tableId,
    required final String date,
    required final String timeSlot,
    required final int numberOfGuests,
    required final String status,
    required final String createdAt,
    final String? endTime,
    final String? notes,
  }) = _$ReportBookingModelImpl;
  const _ReportBookingModel._() : super._();

  factory _ReportBookingModel.fromJson(Map<String, dynamic> json) =
      _$ReportBookingModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get bookingType;
  @override
  String get guestName;
  @override
  String get phone;
  @override
  String get tableId;
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
  String? get endTime;
  @override
  String? get notes;

  /// Create a copy of ReportBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportBookingModelImplCopyWith<_$ReportBookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
