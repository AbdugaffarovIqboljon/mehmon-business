import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_view_controller.dart';
import 'package:mehmon/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_calendar_handle.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_strip.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_month_calendar.dart';

class _FakeBookingRepository implements BookingRepository {
  _FakeBookingRepository(this.bookings);

  final List<BookingEntity> bookings;

  @override
  Future<Result<void>> cancelBooking(String id) async {
    return const Success(null);
  }

  @override
  Future<Result<BookingEntity>> createBooking(BookingEntity booking) async {
    return Success(booking);
  }

  @override
  Future<Result<BookingEntity>> getBookingById(String id) async {
    return Success(bookings.first);
  }

  @override
  Future<Result<List<BookingEntity>>> getBookings() async {
    return Success(bookings);
  }
}

void main() {
  group('BookingsPage UI', () {
    testWidgets(
      'expanded month + empty state does not overflow on compact size',
      (tester) async {
        final container = await _pumpBookingsPage(
          tester,
          bookings: const [],
          size: const Size(390, 680),
        );

        await tester.tap(find.byType(BookingCalendarHandle));
        await tester.pumpAndSettle();

        expect(find.byType(BookingMonthCalendar), findsOneWidget);
        expect(
          container.read(bookingViewControllerProvider).isCalendarExpanded,
          true,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('collapsed strip keeps selected day centered initially', (
      tester,
    ) async {
      await _pumpBookingsPage(tester, bookings: _sampleBookings());

      final stripRect = tester.getRect(find.byType(BookingDateStrip));
      final selectedCardRect = tester.getRect(
        find.byKey(const ValueKey('booking-date-card-selected')),
      );
      final distanceFromCenter =
          (selectedCardRect.center.dx - stripRect.center.dx).abs();

      expect(distanceFromCenter, lessThanOrEqualTo(16));
    });

    testWidgets('date strip appends next days when reaching end edge', (
      tester,
    ) async {
      await _pumpBookingsPage(tester, bookings: _sampleBookings());
      final baseDate = DateUtils.dateOnly(DateTime.now());
      final nextDayOutsideInitialWindow = baseDate.add(const Duration(days: 5));
      final targetFinder = find.byKey(
        ValueKey(
          'booking-date-card-${nextDayOutsideInitialWindow.toIso8601String()}',
        ),
      );

      expect(targetFinder, findsNothing);

      await tester.drag(find.byType(BookingDateStrip), const Offset(-1200, 0));
      await tester.pumpAndSettle();

      expect(targetFinder, findsWidgets);
    });

    testWidgets('handle bar position follows calendar state', (tester) async {
      await _pumpBookingsPage(tester, bookings: _sampleBookings());

      final handleFinder = find.byKey(
        const ValueKey('booking-calendar-handle-pill'),
      );
      final collapsedRect = tester.getRect(handleFinder);

      await tester.tap(find.byType(BookingCalendarHandle));
      await tester.pumpAndSettle();

      final expandedRect = tester.getRect(handleFinder);
      expect(expandedRect.center.dy, isNot(equals(collapsedRect.center.dy)));
    });

    testWidgets(
      'selecting month date updates selected day and auto-collapses',
      (tester) async {
        final container = await _pumpBookingsPage(
          tester,
          bookings: _sampleBookings(),
        );
        final targetDate = DateUtils.dateOnly(
          DateTime.now().add(const Duration(days: 3)),
        );

        await tester.tap(find.byType(BookingCalendarHandle));
        await tester.pumpAndSettle();

        final targetDayFinder = find.byKey(
          ValueKey('booking-month-day-${targetDate.toIso8601String()}'),
        );
        expect(targetDayFinder, findsWidgets);

        await tester.tap(targetDayFinder.first);
        await tester.pumpAndSettle();

        expect(find.byType(BookingMonthCalendar), findsNothing);
        expect(find.byType(BookingDateStrip), findsOneWidget);
        final state = container.read(bookingViewControllerProvider);
        expect(DateUtils.isSameDay(state.selectedDate, targetDate), isTrue);
        expect(state.isCalendarExpanded, isFalse);
      },
    );
  });
}

Future<ProviderContainer> _pumpBookingsPage(
  WidgetTester tester, {
  required List<BookingEntity> bookings,
  Size size = const Size(390, 844),
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  final container = ProviderContainer(
    overrides: [
      bookingRepositoryProvider.overrideWithValue(
        _FakeBookingRepository(bookings),
      ),
    ],
  );
  addTearDown(container.dispose);
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: BookingsPage()),
    ),
  );
  await tester.pumpAndSettle();

  return container;
}

List<BookingEntity> _sampleBookings() {
  final now = DateTime.now();
  final day = DateTime(now.year, now.month, now.day);
  return [
    BookingEntity(
      id: 'b_1',
      guestName: 'Guest 1',
      dateTime: day.add(const Duration(hours: 10)),
      status: 'confirmed',
    ),
    BookingEntity(
      id: 'b_2',
      guestName: 'Guest 2',
      dateTime: day.add(const Duration(hours: 14)),
    ),
  ];
}
