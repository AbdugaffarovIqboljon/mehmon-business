import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';

// ── Mock Repository ─────────────────────────────────────────────────────

class MockBookingRepository implements BookingRepository {
  List<BookingEntity> mockBookings = [
    BookingEntity(
      id: 'bk_test_01',
      guestName: 'Test Guest',
      dateTime: DateTime(2026, 3, 1, 19),
      partySize: 4,
      status: 'confirmed',
    ),
    BookingEntity(
      id: 'bk_test_02',
      guestName: 'Another Guest',
      dateTime: DateTime(2026, 3, 1, 20),
    ),
  ];

  @override
  Future<Result<List<BookingEntity>>> getBookings() async {
    return Success(mockBookings);
  }

  @override
  Future<Result<BookingEntity>> getBookingById(String id) async {
    return Success(mockBookings.first);
  }

  @override
  Future<Result<BookingEntity>> createBooking(BookingEntity booking) async {
    return Success(booking);
  }

  @override
  Future<Result<void>> cancelBooking(String id) async {
    return const Success(null);
  }
}

// ── Tests ────────────────────────────────────────────────────────────────

void main() {
  late ProviderContainer container;
  late MockBookingRepository mockRepo;

  setUp(() {
    mockRepo = MockBookingRepository();
    container = ProviderContainer(
      overrides: [bookingRepositoryProvider.overrideWithValue(mockRepo)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('BookingController', () {
    test('loads bookings on build', () async {
      // Read the provider to trigger build().
      final sub = container.listen(
        bookingControllerProvider,
        (previous, next) {},
      );

      // Wait for the async notifier to resolve.
      await container.read(bookingControllerProvider.future);

      final state = sub.read();
      expect(state.hasValue, isTrue);
      expect(state.value, hasLength(2));
      expect(state.value!.first.guestName, equals('Test Guest'));
    });

    test('returns correct booking details', () async {
      await container.read(bookingControllerProvider.future);

      final state = container.read(bookingControllerProvider);
      final booking = state.value!.first;

      expect(booking.id, equals('bk_test_01'));
      expect(booking.partySize, equals(4));
      expect(booking.status, equals('confirmed'));
    });

    test('handles empty bookings list', () async {
      mockRepo.mockBookings = [];

      // Create a fresh container to get a clean build.
      final freshContainer = ProviderContainer(
        overrides: [bookingRepositoryProvider.overrideWithValue(mockRepo)],
      );

      await freshContainer.read(bookingControllerProvider.future);

      final state = freshContainer.read(bookingControllerProvider);
      expect(state.hasValue, isTrue);
      expect(state.value, isEmpty);

      freshContainer.dispose();
    });
  });
}
