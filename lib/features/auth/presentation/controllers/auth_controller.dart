import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mehmon/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';
import 'package:mehmon/features/auth/domain/repositories/auth_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => DummyAuthRemoteDataSource(),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  ),
);

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthEntity?>(AuthController.new);

// ── Controller ────────────────────────────────────────────────────────────

/// Manages authentication state using [AsyncNotifier].
class AuthController extends AsyncNotifier<AuthEntity?> {
  late final AuthRepository _repo;

  @override
  FutureOr<AuthEntity?> build() {
    _repo = ref.watch(authRepositoryProvider);
    return null; // No user initially.
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final result = await _repo.login(email: email, password: password);
    state = result.when(
      success: AsyncData.new,
      error: (f) => AsyncError(f, StackTrace.current),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await _repo.register(
      name: name,
      email: email,
      password: password,
    );
    state = result.when(
      success: AsyncData.new,
      error: (f) => AsyncError(f, StackTrace.current),
    );
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const AsyncData(null);
  }
}
