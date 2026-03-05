import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
abstract class StatsModel with _$StatsModel {
  const factory StatsModel({
    @JsonKey(name: 'total_bookings') required int totalBookings,
    @JsonKey(name: 'total_guests') required int totalGuests,
    @JsonKey(name: 'occupancy_rate') required double occupancyRate,
    required double revenue,
    @Default('daily') String period,
  }) = _StatsModel;

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);
}
