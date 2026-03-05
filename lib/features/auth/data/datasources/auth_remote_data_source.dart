import 'package:mehmon/features/auth/data/models/auth_model.dart';

/// Remote data source contract for auth operations.
abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});

  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();
}

/// Dummy implementation returning mock data for development.
class DummyAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay.
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const AuthModel(
      id: 'usr_001',
      email: 'staff@mehmon.app',
      name: 'Demo Staff',
      accessToken: 'mock_access_token',
      refreshToken: 'mock_refresh_token',
    );
  }

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return AuthModel(
      id: 'usr_002',
      email: email,
      name: name,
      accessToken: 'mock_access_token',
      refreshToken: 'mock_refresh_token',
    );
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}
