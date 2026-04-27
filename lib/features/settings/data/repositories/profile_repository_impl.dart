import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/settings/data/datasources/profile_remote_data_source.dart';
import 'package:mehmon/features/settings/data/models/profile_model.dart';
import 'package:mehmon/features/settings/domain/entities/profile_entity.dart';
import 'package:mehmon/features/settings/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required ProfileRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final ProfileRemoteDataSource _dataSource;

  ProfileEntity _toEntity(ProfileModel m) => ProfileEntity(
        id: m.id,
        name: m.name,
        phone: m.phone,
        cafeName: m.cafeName,
        role: m.role,
        imageUrl: m.imageUrl,
        institutionType: m.institutionType,
        address: m.address,
        openingTime: m.openingTime,
        closingTime: m.closingTime,
        createdAt: m.createdAt,
      );

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      return Success(_toEntity(await _dataSource.getProfile()));
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<ProfileEntity>> updateProfile({
    required String name,
    required String phone,
    required String cafeName,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
  }) async {
    try {
      return Success(
        _toEntity(
          await _dataSource.updateProfile(
            name: name,
            phone: phone,
            cafeName: cafeName,
            imageUrl: imageUrl,
            institutionType: institutionType,
            address: address,
            openingTime: openingTime,
            closingTime: closingTime,
          ),
        ),
      );
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String>> logout() async {
    try {
      return Success(await _dataSource.logout());
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }
}
