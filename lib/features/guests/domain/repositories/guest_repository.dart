import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';

abstract class GuestRepository {
  Future<Result<List<GuestEntity>>> getGuests();

  Future<Result<GuestEntity>> getGuestById({
    required String id,
  });

  Future<Result<GuestEntity>> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  });

  Future<Result<GuestEntity>> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  });

  Future<Result<String>> deleteGuest({required String id});
}
