import 'package:mehmon/features/stats/data/models/stats_model.dart';

/// Remote data source contract for statistics.
abstract class StatsRemoteDataSource {
  Future<StatsModel> getStats({String period = 'daily'});
}

/// Dummy implementation returning mock data.
class DummyStatsRemoteDataSource implements StatsRemoteDataSource {
  @override
  Future<StatsModel> getStats({String period = 'daily'}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return StatsModel(
      totalBookings: 47,
      totalGuests: 128,
      occupancyRate: 0.73,
      revenue: 4250.50,
      period: period,
    );
  }
}
