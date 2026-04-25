import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/networking/auth_interceptor.dart';
import 'package:mehmon/core/networking/logging_interceptor.dart';
import 'package:mehmon/core/networking/token_store.dart';

final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio(
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

  dio.interceptors.add(
    AuthInterceptor(tokenStore: ref.watch(tokenStoreProvider)),
  );

  if (kDebugMode) {
    dio.interceptors.add(LoggingInterceptor());
  }

  return dio;
});
