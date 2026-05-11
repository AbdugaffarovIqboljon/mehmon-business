import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';

// ── Mock Repository ─────────────────────────────────────────────────────

class MockBookingRepository implements BookingRepository {
  List<BookingEntity> mockBookings = [
    const BookingEntity(
      id: 'bk_test_01',
      guestName: 'Test Guest',
      phone: '+998901234567',
      date: '2026-03-01',
      timeSlot: '19:00',
      numberOfGuests: 4,
      status: 'confirmed',
      createdAt: '2026-03-01T00:00:00Z',
    ),
    const BookingEntity(
      id: 'bk_test_02',
      guestName: 'Another Guest',
      phone: '+998901234568',
      date: '2026-03-01',
      timeSlot: '20:00',
      numberOfGuests: 2,
      status: 'confirmed',
      createdAt: '2026-03-01T00:00:00Z',
    ),
  ];

  @override
  Future<Result<List<BookingEntity>>> getBookings() async {
    return Success(mockBookings);
  }

  @override
  Future<Result<BookingEntity>> createBooking({
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    return Success(
      BookingEntity(
        id: 'bk_new',
        guestName: guestName,
        phone: phone,
        date: date,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
        status: 'confirmed',
        createdAt: '2026-03-01T00:00:00Z',
      ),
    );
  }

  @override
  Future<Result<BookingEntity>> updateBooking({
    required String id,
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    return Success(
      BookingEntity(
        id: id,
        guestName: guestName,
        phone: phone,
        date: date,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
        status: status,
        createdAt: '2026-03-01T00:00:00Z',
      ),
    );
  }

  @override
  Future<Result<String>> deleteBooking({required String id}) async {
    return Success(id);
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
