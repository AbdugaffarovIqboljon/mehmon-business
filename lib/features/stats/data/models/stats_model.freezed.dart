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

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) {
  return _StatsModel.fromJson(json);
}

/// @nodoc
mixin _$StatsModel {
  @JsonKey(name: 'total_bookings')
  int get totalBookings => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_guests')
  int get totalGuests => throw _privateConstructorUsedError;
  @JsonKey(name: 'occupancy_rate')
  double get occupancyRate => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Serializes this StatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsModelCopyWith<StatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsModelCopyWith<$Res> {
  factory $StatsModelCopyWith(
    StatsModel value,
    $Res Function(StatsModel) then,
  ) = _$StatsModelCopyWithImpl<$Res, StatsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_bookings') int totalBookings,
    @JsonKey(name: 'total_guests') int totalGuests,
    @JsonKey(name: 'occupancy_rate') double occupancyRate,
    double revenue,
    String period,
  });
}

/// @nodoc
class _$StatsModelCopyWithImpl<$Res, $Val extends StatsModel>
    implements $StatsModelCopyWith<$Res> {
  _$StatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsModel
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
abstract class _$$StatsModelImplCopyWith<$Res>
    implements $StatsModelCopyWith<$Res> {
  factory _$$StatsModelImplCopyWith(
    _$StatsModelImpl value,
    $Res Function(_$StatsModelImpl) then,
  ) = __$$StatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_bookings') int totalBookings,
    @JsonKey(name: 'total_guests') int totalGuests,
    @JsonKey(name: 'occupancy_rate') double occupancyRate,
    double revenue,
    String period,
  });
}

/// @nodoc
class __$$StatsModelImplCopyWithImpl<$Res>
    extends _$StatsModelCopyWithImpl<$Res, _$StatsModelImpl>
    implements _$$StatsModelImplCopyWith<$Res> {
  __$$StatsModelImplCopyWithImpl(
    _$StatsModelImpl _value,
    $Res Function(_$StatsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatsModel
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
      _$StatsModelImpl(
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
@JsonSerializable()
class _$StatsModelImpl implements _StatsModel {
  const _$StatsModelImpl({
    @JsonKey(name: 'total_bookings') required this.totalBookings,
    @JsonKey(name: 'total_guests') required this.totalGuests,
    @JsonKey(name: 'occupancy_rate') required this.occupancyRate,
    required this.revenue,
    this.period = 'daily',
  });

  factory _$StatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_bookings')
  final int totalBookings;
  @override
  @JsonKey(name: 'total_guests')
  final int totalGuests;
  @override
  @JsonKey(name: 'occupancy_rate')
  final double occupancyRate;
  @override
  final double revenue;
  @override
  @JsonKey()
  final String period;

  @override
  String toString() {
    return 'StatsModel(totalBookings: $totalBookings, totalGuests: $totalGuests, occupancyRate: $occupancyRate, revenue: $revenue, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsModelImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.totalGuests, totalGuests) ||
                other.totalGuests == totalGuests) &&
            (identical(other.occupancyRate, occupancyRate) ||
                other.occupancyRate == occupancyRate) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBookings,
    totalGuests,
    occupancyRate,
    revenue,
    period,
  );

  /// Create a copy of StatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsModelImplCopyWith<_$StatsModelImpl> get copyWith =>
      __$$StatsModelImplCopyWithImpl<_$StatsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsModelImplToJson(this);
  }
}

abstract class _StatsModel implements StatsModel {
  const factory _StatsModel({
    @JsonKey(name: 'total_bookings') required final int totalBookings,
    @JsonKey(name: 'total_guests') required final int totalGuests,
    @JsonKey(name: 'occupancy_rate') required final double occupancyRate,
    required final double revenue,
    final String period,
  }) = _$StatsModelImpl;

  factory _StatsModel.fromJson(Map<String, dynamic> json) =
      _$StatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_bookings')
  int get totalBookings;
  @override
  @JsonKey(name: 'total_guests')
  int get totalGuests;
  @override
  @JsonKey(name: 'occupancy_rate')
  double get occupancyRate;
  @override
  double get revenue;
  @override
  String get period;

  /// Create a copy of StatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsModelImplCopyWith<_$StatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
