import 'package:dio/dio.dart';
import 'package:mehmon/core/config/env.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/networking/auth_interceptor.dart';
import 'package:mehmon/core/networking/logging_interceptor.dart';
import 'package:mehmon/core/networking/token_store.dart';

/// Pre-configured [Dio] HTTP client.
///
/// - Base URL sourced from [Env].
/// - Logging and auth interceptors attached.
/// - Global error mapping to [ApiException].
class DioClient {
  DioClient({required TokenStore tokenStore}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectTimeoutMs,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeoutMs,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(tokenStore: tokenStore),
      if (!Env.isProduction) LoggingInterceptor(),
    ]);
  }

  late final Dio _dio;

  /// Expose the underlying [Dio] instance for data-source usage.
  Dio get dio => _dio;

  // ── Convenience wrappers with global error mapping ──────────────────

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<T>(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _mapException(e);
    }
  }

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    try {
      return await _dio.post<T>(path, data: data);
    } on DioException catch (e) {
      throw _mapException(e);
    }
  }

  Future<Response<T>> put<T>(String path, {Object? data}) async {
    try {
      return await _dio.put<T>(path, data: data);
    } on DioException catch (e) {
      throw _mapException(e);
    }
  }

  Future<Response<T>> delete<T>(String path) async {
    try {
      return await _dio.delete<T>(path);
    } on DioException catch (e) {
      throw _mapException(e);
    }
  }

  // ── Private helpers ────────────────────────────────────────────────

  ApiException _mapException(DioException e) {
    return ApiException(
      message: e.response?.statusMessage ?? e.message ?? 'Unknown error',
      statusCode: e.response?.statusCode,
      error: e.error,
    );
  }
}
