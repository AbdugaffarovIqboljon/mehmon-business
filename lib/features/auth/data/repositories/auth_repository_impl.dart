import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';
import 'package:mehmon/features/auth/domain/repositories/auth_repository.dart';

/// Concrete [AuthRepository] implementation backed by a remote data source.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  bool _isAuthenticated = false;

  @override
  Future<Result<AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      _isAuthenticated = true;
      return Success(
        AuthEntity(
          id: model.id,
          email: model.email,
          name: model.name,
          phone: model.phone,
          avatarUrl: model.avatarUrl,
          role: model.role,
        ),
      );
    } on ApiException catch (e, st) {
      return Err(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
          stackTrace: st,
        ),
      );
    } on Exception catch (e, st) {
      return Err(UnknownFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<AuthEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      _isAuthenticated = true;
      return Success(
        AuthEntity(
          id: model.id,
          email: model.email,
          name: model.name,
          phone: model.phone,
          avatarUrl: model.avatarUrl,
          role: model.role,
        ),
      );
    } on ApiException catch (e, st) {
      return Err(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
          stackTrace: st,
        ),
      );
    } on Exception catch (e, st) {
      return Err(UnknownFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
      _isAuthenticated = false;
      return const Success(null);
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<bool> isAuthenticated() async => _isAuthenticated;
}
