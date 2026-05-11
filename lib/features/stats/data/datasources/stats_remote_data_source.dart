import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/stats/data/models/stats_model.dart';

abstract class StatsRemoteDataSource {
  Future<AnalyticsSummaryModel> getSummary();

  Future<AnalyticsReportModel> getReports({
    String? startDate,
    String? endDate,
  });
}

class StatsRemoteDataSourceImpl implements StatsRemoteDataSource {
  const StatsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<AnalyticsSummaryModel> getSummary() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiConstants.analyticsSummary);
      return AnalyticsSummaryModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<AnalyticsReportModel> getReports({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.analyticsReports,
        queryParameters: {
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
      );
      return AnalyticsReportModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
