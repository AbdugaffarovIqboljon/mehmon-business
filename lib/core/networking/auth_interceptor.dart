import 'package:dio/dio.dart';
import 'package:mehmon/core/networking/token_store.dart';

/// Interceptor that attaches the Bearer token to every outgoing request.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required TokenStore tokenStore}) : _tokenStore = tokenStore;

  final TokenStore _tokenStore;

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
    handler.next(err);
  }
}
