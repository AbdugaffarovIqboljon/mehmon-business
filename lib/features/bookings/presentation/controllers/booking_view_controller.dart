import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_view_state.dart';

final bookingViewControllerProvider =
    NotifierProvider<BookingViewController, BookingViewState>(
  BookingViewController.new,
);

final bookingDateStripProvider = Provider<List<DateTime>>((ref) {
  final selectedDate = ref.watch(
    bookingViewControllerProvider.select((state) => state.selectedDate),
  );
  return List<DateTime>.unmodifiable(
    List.generate(
      9,
      (index) => _normalizeDate(selectedDate.add(Duration(days: index - 4))),
    ),
  );
});

final bookingCountsByDayProvider = Provider<Map<DateTime, int>>((ref) {
  final bookings = ref.watch(bookingControllerProvider).valueOrNull ?? const [];
  final counts = <DateTime, int>{};

  for (final booking in bookings) {
    final day = _normalizeDate(booking.dateTime);
    counts[day] = (counts[day] ?? 0) + 1;
  }

  return Map<DateTime, int>.unmodifiable(counts);
});

final selectedDayBookingsProvider = Provider<List<BookingEntity>>((ref) {
  final selectedDate = ref.watch(
    bookingViewControllerProvider.select((state) => state.selectedDate),
  );
  final bookings = ref.watch(bookingControllerProvider).valueOrNull ?? const [];
  final selectedDayBookings = bookings
      .where((booking) => DateUtils.isSameDay(booking.dateTime, selectedDate))
      .toList()
    ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  return List<BookingEntity>.unmodifiable(selectedDayBookings);
});

class BookingViewController extends Notifier<BookingViewState> {
  @override
  BookingViewState build() {
    return BookingViewState.initial();
  }

  void toggleCalendar() {
    state = state.copyWith(isCalendarExpanded: !state.isCalendarExpanded);
  }

  void expandCalendar() {
    if (state.isCalendarExpanded) {
      return;
    }
    state = state.copyWith(isCalendarExpanded: true);
  }

  void collapseCalendar() {
    if (!state.isCalendarExpanded) {
      return;
    }
    state = state.copyWith(isCalendarExpanded: false);
  }

  void selectDate(DateTime date, {bool collapseCalendar = false}) {
    final normalizedDate = _normalizeDate(date);
    state = state.copyWith(
      selectedDate: normalizedDate,
      focusedMonth: DateTime(normalizedDate.year, normalizedDate.month),
      isCalendarExpanded: !collapseCalendar && state.isCalendarExpanded,
    );
  }

  void showPreviousMonth() {
    final focusedMonth = state.focusedMonth;
    state = state.copyWith(
      focusedMonth: DateTime(focusedMonth.year, focusedMonth.month - 1),
    );
  }

  void showNextMonth() {
    final focusedMonth = state.focusedMonth;
    state = state.copyWith(
      focusedMonth: DateTime(focusedMonth.year, focusedMonth.month + 1),
    );
  }
}

DateTime _normalizeDate(DateTime date) => DateUtils.dateOnly(date);
