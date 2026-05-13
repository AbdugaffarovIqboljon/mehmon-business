import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/core/networking/token_store.dart';
import 'package:mehmon/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mehmon/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';
import 'package:mehmon/features/auth/domain/repositories/auth_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(
      dio: ref.watch(dioClientProvider),
    ),
    tokenStore: ref.watch(tokenStoreProvider),
  );
});

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthEntity?>(AuthController.new);

// ── Controller ────────────────────────────────────────────────────────────

class AuthController extends AsyncNotifier<AuthEntity?> {
  late final AuthRepository _repo;
  late TokenStore _tokenStore;

  @override
  Future<AuthEntity?> build() async {
    _repo = ref.watch(authRepositoryProvider);
    _tokenStore = ref.watch(tokenStoreProvider);

    final token = await _tokenStore.getAccessToken();
    if (token == null) return null;

    final prefs = ref.read(sharedPreferencesProvider);
    final userJson = prefs.getString(kStoredUser);
    if (userJson == null) return null;

    try {
      final map = jsonDecode(userJson) as Map<String, dynamic>;
      final user = UserEntity(
        id: map['id'] as String,
        name: map['name'] as String,
        phone: map['phone'] as String,
        cafeName: map['cafeName'] as String,
        role: map['role'] as String,
      );
      return AuthEntity(
        accessToken: token,
        refreshToken: '',
        user: user,
      );
    } on Object {
      await prefs.remove(kStoredUser);
      return null;
    }
  }

  void _saveUserToPrefs(AuthEntity entity) {
    ref.read(sharedPreferencesProvider).setString(
          kStoredUser,
          jsonEncode({
            'id': entity.user.id,
            'name': entity.user.name,
            'phone': entity.user.phone,
            'cafeName': entity.user.cafeName,
            'role': entity.user.role,
          }),
        );
  }

  Future<void> login({required String phone, required String password}) async {
    state = const AsyncLoading();
    final result = await _repo.login(phone: phone, password: password);
    result.when(
      success: (entity) {
        _saveUserToPrefs(entity);
        state = AsyncData(entity);
      },
      error: (failure) => state = AsyncError(failure.message, StackTrace.current),
    );
  }

  Future<void> register({
    required String name,
    required String phone,
    required String cafeName,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await _repo.register(
      name: name,
      phone: phone,
      cafeName: cafeName,
      password: password,
    );
    result.when(
      success: (entity) {
        _saveUserToPrefs(entity);
        state = AsyncData(entity);
      },
      error: (failure) => state = AsyncError(failure.message, StackTrace.current),
    );
  }

  Future<void> loginByPhone({
    required String phone,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await _repo.login(phone: phone, password: password);
    state = result.when(
      success: (entity) {
        _saveUserToPrefs(entity);
        return AsyncData(entity);
      },
      error: (f) => AsyncError(f, StackTrace.current),
    );
  }

  Future<void> registerByPhone({
    required String name,
    required String phone,
    required String cafeName,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await _repo.register(
      name: name,
      phone: phone,
      cafeName: cafeName,
      password: password,
    );
    state = result.when(
      success: (entity) {
        _saveUserToPrefs(entity);
        return AsyncData(entity);
      },
      error: (f) => AsyncError(f, StackTrace.current),
    );
  }

  Future<void> logout() async {
    try {
      await _repo.logout(); // POST /api/auth/logout
    } on Object {
      // Backend call failed — still proceed with local logout.
    } finally {
      await _tokenStore.clearTokens();
      await ref.read(sharedPreferencesProvider).remove(kStoredUser);
      state = const AsyncData(null);
    }
  }
}
