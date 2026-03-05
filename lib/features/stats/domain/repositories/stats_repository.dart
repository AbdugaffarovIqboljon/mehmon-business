import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';

/// Contract for statistics operations.
abstract class StatsRepository {
  Future<Result<StatsEntity>> getStats({String period = 'daily'});
}
