import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/networking/token_store.dart';

/// Interceptor that attaches the Bearer token to every outgoing request and
/// transparently handles 401 responses by refreshing the access token,
/// queueing concurrent failures, and retrying the original request.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required TokenStore tokenStore,
    required VoidCallback onLogout,
  })  : _tokenStore = tokenStore,
        _onLogout = onLogout;

  final TokenStore _tokenStore;
  final VoidCallback _onLogout;

  bool _isRefreshing = false;
  final List<Completer<void>> _refreshCompleter = <Completer<void>>[];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    if (statusCode != 401) {
      handler.next(err);
      return;
    }

    unawaited(_handle401(err, handler));
  }

  Future<void> _handle401(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_isRefreshing) {
      final completer = Completer<void>();
      _refreshCompleter.add(completer);
      try {
        await completer.future;
      } on Object {
        handler.next(err);
        return;
      }

      try {
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
      } on Object {
        handler.next(err);
      }
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await _tokenStore.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token');
      }

      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final refreshResponse = await refreshDio.post<Map<String, dynamic>>(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final data = refreshResponse.data;
      if (data == null) {
        throw Exception('Empty refresh response');
      }

      final newAccess = data['accessToken'] as String;
      final newRefresh = data['refreshToken'] as String;

      await _tokenStore.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      for (final c in _refreshCompleter) {
        c.complete();
      }
      _refreshCompleter.clear();
      _isRefreshing = false;

      final response = await _retry(err.requestOptions);
      handler.resolve(response);
    } on Object {
      _isRefreshing = false;
      for (final c in _refreshCompleter) {
        c.completeError('Refresh failed');
      }
      _refreshCompleter.clear();

      await _tokenStore.clearTokens();
      _onLogout();
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final token = await _tokenStore.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        if (token != null) 'Authorization': 'Bearer $token',
      },
      contentType: requestOptions.contentType,
      responseType: requestOptions.responseType,
    );

    final retryDio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    return retryDio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
