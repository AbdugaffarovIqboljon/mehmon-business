import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/features/bookings/presentation/controllers/book_a_table_date_state.dart';

final bookATableInitialDateProvider = Provider<DateTime>((ref) {
  return DateUtils.dateOnly(DateTime.now());
});

final bookATableDateControllerProvider =
    AutoDisposeNotifierProvider<BookATableDateController, BookATableDateState>(
      BookATableDateController.new,
      dependencies: [bookATableInitialDateProvider],
    );

class BookATableDateController
    extends AutoDisposeNotifier<BookATableDateState> {
  static const int _revealStep = 4;
  static const int _targetWindowSize = 7;

  @override
  BookATableDateState build() {
    final initialDate = DateUtils.dateOnly(
      ref.watch(bookATableInitialDateProvider),
    );
    return BookATableDateState.initial(initialDate);
  }

  void selectMonth(DateTime month) {
    final normalizedMonth = DateTime(month.year, month.month);
    final daysInNewMonth = _daysInMonth(normalizedMonth);
    final safeDay = _clampDay(state.selectedDate.day, max: daysInNewMonth);
    final nextSelectedDate = DateTime(
      normalizedMonth.year,
      normalizedMonth.month,
      safeDay,
    );
    final window = _windowAroundDay(
      centerDay: safeDay,
      daysInMonth: daysInNewMonth,
      targetSize: math.max(
        _targetWindowSize,
        (state.visibleEndDay - state.visibleStartDay) + 1,
      ),
    );

    state = state.copyWith(
      selectedMonth: normalizedMonth,
      selectedDate: nextSelectedDate,
      visibleStartDay: window.$1,
      visibleEndDay: window.$2,
    );
  }

  void selectDate(DateTime date) {
    final normalizedDate = DateUtils.dateOnly(date);
    if (!_isSameMonth(normalizedDate, state.selectedMonth)) {
      return;
    }

    var nextState = state.copyWith(selectedDate: normalizedDate);
    if (normalizedDate.day < nextState.visibleStartDay) {
      nextState = nextState.copyWith(visibleStartDay: normalizedDate.day);
    }
    if (normalizedDate.day > nextState.visibleEndDay) {
      nextState = nextState.copyWith(visibleEndDay: normalizedDate.day);
    }
    state = nextState;
  }

  void revealPreviousDates() {
    if (!state.canRevealPreviousDates) return;
    final nextStart = math.max(1, state.visibleStartDay - _revealStep);
    if (nextStart == state.visibleStartDay) return;

    state = state.copyWith(visibleStartDay: nextStart);
  }

  void revealNextDates() {
    if (!state.canRevealNextDates) return;
    final nextEnd = math.min(
      state.daysInMonth,
      state.visibleEndDay + _revealStep,
    );
    if (nextEnd == state.visibleEndDay) return;

    state = state.copyWith(visibleEndDay: nextEnd);
  }

  static bool _isSameMonth(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }

  static int _daysInMonth(DateTime month) {
    return DateTime(month.year, month.month + 1, 0).day;
  }

  static int _clampDay(int day, {required int max}) {
    if (day < 1) return 1;
    if (day > max) return max;
    return day;
  }

  static (int, int) _windowAroundDay({
    required int centerDay,
    required int daysInMonth,
    required int targetSize,
  }) {
    var start = centerDay - (targetSize ~/ 2);
    var end = start + targetSize - 1;

    if (start < 1) {
      end += 1 - start;
      start = 1;
    }

    if (end > daysInMonth) {
      final overflow = end - daysInMonth;
      start = math.max(1, start - overflow);
      end = daysInMonth;
    }

    return (start, end);
  }
}
