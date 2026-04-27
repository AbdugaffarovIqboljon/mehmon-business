import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/core/networking/token_store.dart';
import 'package:mehmon/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mehmon/features/auth/domain/entities/auth_entity.dart';
import 'package:mehmon/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required TokenStore tokenStore,
  })  : _remoteDataSource = remoteDataSource,
        _tokenStore = tokenStore;

  final AuthRemoteDataSource _remoteDataSource;
  final TokenStore _tokenStore;

  @override
  Future<Result<AuthEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final model = await _remoteDataSource.login(
        phone: phone,
        password: password,
      );

      await _tokenStore.saveTokens(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );

      return Success(AuthEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        user: UserEntity(
          id: model.user.id,
          name: model.user.name,
          phone: model.user.phone,
          cafeName: model.user.cafeName,
          role: model.user.role,
        ),
      ));
    } on ApiException catch (e, st) {
      return Err(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
        stackTrace: st,
      ));
    } on Exception catch (e, st) {
      return Err(UnknownFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<AuthEntity>> register({
    required String name,
    required String phone,
    required String cafeName,
    required String password,
  }) async {
    try {
      final model = await _remoteDataSource.register(
        name: name,
        phone: phone,
        cafeName: cafeName,
        password: password,
      );

      await _tokenStore.saveTokens(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );

      return Success(AuthEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        user: UserEntity(
          id: model.user.id,
          name: model.user.name,
          phone: model.user.phone,
          cafeName: model.user.cafeName,
          role: model.user.role,
        ),
      ));
    } on ApiException catch (e, st) {
      return Err(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
        stackTrace: st,
      ));
    } on Exception catch (e, st) {
      return Err(UnknownFailure(message: e.toString(), stackTrace: st));
    }
  }
}
