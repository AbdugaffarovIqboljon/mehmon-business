import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_entity.freezed.dart';

/// Domain entity representing restaurant statistics.
@freezed
abstract class StatsEntity with _$StatsEntity {
  const factory StatsEntity({
    required int totalBookings,
    required int totalGuests,
    required double occupancyRate,
    required double revenue,
    @Default('daily') String period,
  }) = _StatsEntity;
}
