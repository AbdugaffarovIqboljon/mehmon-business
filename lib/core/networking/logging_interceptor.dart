import 'dart:developer' as dev;

import 'package:dio/dio.dart';

/// Interceptor that logs HTTP requests and responses in debug builds.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dev.log('→ ${options.method} ${options.uri}', name: 'HTTP');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    dev.log(
      '← ${response.statusCode} ${response.requestOptions.uri}',
      name: 'HTTP',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    dev.log(
      '✖ ${err.type} ${err.requestOptions.uri} — ${err.message}',
      name: 'HTTP',
      error: err.error,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}
