import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';

/// Contract for guest operations.
abstract class GuestRepository {
  Future<Result<List<GuestEntity>>> getGuests();
  Future<Result<GuestEntity>> getGuestById(String id);
  Future<Result<GuestEntity>> createGuest(GuestEntity guest);
  Future<Result<GuestEntity>> updateGuest(GuestEntity guest);
}
