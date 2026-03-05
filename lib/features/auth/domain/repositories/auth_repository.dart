import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';

/// Contract for authentication operations.
abstract class AuthRepository {
  /// Attempt login with email and password.
  Future<Result<AuthEntity>> login({
    required String email,
    required String password,
  });

  /// Register a new user.
  Future<Result<AuthEntity>> register({
    required String name,
    required String email,
    required String password,
  });

  /// Sign out the current user.
  Future<Result<void>> logout();

  /// Check if the user is currently authenticated.
  Future<bool> isAuthenticated();
}
