import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/stats/data/datasources/stats_remote_data_source.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';
import 'package:mehmon/features/stats/domain/repositories/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  const StatsRepositoryImpl({required StatsRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final StatsRemoteDataSource _dataSource;

  @override
  Future<Result<AnalyticsSummaryEntity>> getSummary() async {
    try {
      final model = await _dataSource.getSummary();
      return Success(
        AnalyticsSummaryEntity(
          totalBookings: model.totalBookings,
          confirmedBookings: model.confirmedBookings,
          pendingBookings: model.pendingBookings,
          totalGuests: model.totalGuests,
          totalTables: model.totalTables,
          occupancyRate: model.occupancyRate,
        ),
      );
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<AnalyticsReportEntity>> getReports({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final model = await _dataSource.getReports(
        startDate: startDate,
        endDate: endDate,
      );
      return Success(
        AnalyticsReportEntity(
          period: AnalyticsPeriodEntity(
            startDate: model.period.startDate,
            endDate: model.period.endDate,
          ),
          totalBookings: model.totalBookings,
          completed: model.completed,
          cancelled: model.cancelled,
          totalGuests: model.totalGuests,
          bookings: model.bookings.map((b) => b.toEntity()).toList(),
        ),
      );
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }
}
