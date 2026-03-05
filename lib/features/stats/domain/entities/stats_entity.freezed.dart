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
mixin _$StatsEntity {
  int get totalBookings => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  double get occupancyRate => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Create a copy of StatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsEntityCopyWith<StatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsEntityCopyWith<$Res> {
  factory $StatsEntityCopyWith(
    StatsEntity value,
    $Res Function(StatsEntity) then,
  ) = _$StatsEntityCopyWithImpl<$Res, StatsEntity>;
  @useResult
  $Res call({
    int totalBookings,
    int totalGuests,
    double occupancyRate,
    double revenue,
    String period,
  });
}

/// @nodoc
class _$StatsEntityCopyWithImpl<$Res, $Val extends StatsEntity>
    implements $StatsEntityCopyWith<$Res> {
  _$StatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? totalGuests = null,
    Object? occupancyRate = null,
    Object? revenue = null,
    Object? period = null,
  }) {
    return _then(
      _value.copyWith(
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            totalGuests: null == totalGuests
                ? _value.totalGuests
                : totalGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            occupancyRate: null == occupancyRate
                ? _value.occupancyRate
                : occupancyRate // ignore: cast_nullable_to_non_nullable
                      as double,
            revenue: null == revenue
                ? _value.revenue
                : revenue // ignore: cast_nullable_to_non_nullable
                      as double,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatsEntityImplCopyWith<$Res>
    implements $StatsEntityCopyWith<$Res> {
  factory _$$StatsEntityImplCopyWith(
    _$StatsEntityImpl value,
    $Res Function(_$StatsEntityImpl) then,
  ) = __$$StatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalBookings,
    int totalGuests,
    double occupancyRate,
    double revenue,
    String period,
  });
}

/// @nodoc
class __$$StatsEntityImplCopyWithImpl<$Res>
    extends _$StatsEntityCopyWithImpl<$Res, _$StatsEntityImpl>
    implements _$$StatsEntityImplCopyWith<$Res> {
  __$$StatsEntityImplCopyWithImpl(
    _$StatsEntityImpl _value,
    $Res Function(_$StatsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? totalGuests = null,
    Object? occupancyRate = null,
    Object? revenue = null,
    Object? period = null,
  }) {
    return _then(
      _$StatsEntityImpl(
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        totalGuests: null == totalGuests
            ? _value.totalGuests
            : totalGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        occupancyRate: null == occupancyRate
            ? _value.occupancyRate
            : occupancyRate // ignore: cast_nullable_to_non_nullable
                  as double,
        revenue: null == revenue
            ? _value.revenue
            : revenue // ignore: cast_nullable_to_non_nullable
                  as double,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StatsEntityImpl implements _StatsEntity {
  const _$StatsEntityImpl({
    required this.totalBookings,
    required this.totalGuests,
    required this.occupancyRate,
    required this.revenue,
    this.period = 'daily',
  });

  @override
  final int totalBookings;
  @override
  final int totalGuests;
  @override
  final double occupancyRate;
  @override
  final double revenue;
  @override
  @JsonKey()
  final String period;

  @override
  String toString() {
    return 'StatsEntity(totalBookings: $totalBookings, totalGuests: $totalGuests, occupancyRate: $occupancyRate, revenue: $revenue, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsEntityImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.totalGuests, totalGuests) ||
                other.totalGuests == totalGuests) &&
            (identical(other.occupancyRate, occupancyRate) ||
                other.occupancyRate == occupancyRate) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBookings,
    totalGuests,
    occupancyRate,
    revenue,
    period,
  );

  /// Create a copy of StatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsEntityImplCopyWith<_$StatsEntityImpl> get copyWith =>
      __$$StatsEntityImplCopyWithImpl<_$StatsEntityImpl>(this, _$identity);
}

abstract class _StatsEntity implements StatsEntity {
  const factory _StatsEntity({
    required final int totalBookings,
    required final int totalGuests,
    required final double occupancyRate,
    required final double revenue,
    final String period,
  }) = _$StatsEntityImpl;

  @override
  int get totalBookings;
  @override
  int get totalGuests;
  @override
  double get occupancyRate;
  @override
  double get revenue;
  @override
  String get period;

  /// Create a copy of StatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsEntityImplCopyWith<_$StatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
