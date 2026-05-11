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
mixin _$AnalyticsReportEntity {
  AnalyticsPeriodEntity get period => throw _privateConstructorUsedError;
  int get totalBookings => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;

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
  });

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

  @override
  String toString() {
    return 'AnalyticsReportEntity(period: $period, totalBookings: $totalBookings, completed: $completed, cancelled: $cancelled, totalGuests: $totalGuests)';
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
                other.totalGuests == totalGuests));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    period,
    totalBookings,
    completed,
    cancelled,
    totalGuests,
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

  /// Create a copy of AnalyticsReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsReportEntityImplCopyWith<_$AnalyticsReportEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
