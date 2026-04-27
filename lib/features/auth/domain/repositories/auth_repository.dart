import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';

/// Contract for authentication operations.
abstract class AuthRepository {
  Future<Result<AuthEntity>> login({
    required String phone,
    required String password,
  });

  Future<Result<AuthEntity>> register({
    required String name,
    required String phone,
    required String cafeName,
    required String password,
  });
}
