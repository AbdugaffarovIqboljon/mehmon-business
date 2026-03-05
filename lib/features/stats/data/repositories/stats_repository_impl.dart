import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/stats/data/datasources/stats_remote_data_source.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';
import 'package:mehmon/features/stats/domain/repositories/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl({required StatsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final StatsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<StatsEntity>> getStats({String period = 'daily'}) async {
    try {
      final m = await _remoteDataSource.getStats(period: period);
      return Success(
        StatsEntity(
          totalBookings: m.totalBookings,
          totalGuests: m.totalGuests,
          occupancyRate: m.occupancyRate,
          revenue: m.revenue,
          period: m.period,
        ),
      );
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }
}
