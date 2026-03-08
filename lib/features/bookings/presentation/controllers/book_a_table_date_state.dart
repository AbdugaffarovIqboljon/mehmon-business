import 'package:flutter/material.dart';

@immutable
class BookATableDateState {
  const BookATableDateState({
    required this.selectedMonth,
    required this.selectedDate,
    required this.visibleStartDay,
    required this.visibleEndDay,
  });

  factory BookATableDateState.initial(DateTime initialDate) {
    final normalizedDate = DateUtils.dateOnly(initialDate);
    final month = DateTime(normalizedDate.year, normalizedDate.month);
    final daysInMonth = _daysInMonth(month.year, month.month);
    final safeDay = _clampDay(normalizedDate.day, min: 1, max: daysInMonth);
    final window = _windowAroundDay(
      centerDay: safeDay,
      daysInMonth: daysInMonth,
      targetSize: 7,
    );

    return BookATableDateState(
      selectedMonth: month,
      selectedDate: DateTime(month.year, month.month, safeDay),
      visibleStartDay: window.$1,
      visibleEndDay: window.$2,
    );
  }

  final DateTime selectedMonth;
  final DateTime selectedDate;
  final int visibleStartDay;
  final int visibleEndDay;

  int get daysInMonth => _daysInMonth(selectedMonth.year, selectedMonth.month);

  List<DateTime> get visibleDates => List<DateTime>.unmodifiable(
    List<DateTime>.generate(
      (visibleEndDay - visibleStartDay) + 1,
      (index) => DateTime(
        selectedMonth.year,
        selectedMonth.month,
        visibleStartDay + index,
      ),
    ),
  );

  bool get canRevealPreviousDates => visibleStartDay > 1;
  bool get canRevealNextDates => visibleEndDay < daysInMonth;

  BookATableDateState copyWith({
    DateTime? selectedMonth,
    DateTime? selectedDate,
    int? visibleStartDay,
    int? visibleEndDay,
  }) {
    return BookATableDateState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      visibleStartDay: visibleStartDay ?? this.visibleStartDay,
      visibleEndDay: visibleEndDay ?? this.visibleEndDay,
    );
  }
}

int _daysInMonth(int year, int month) => DateTime(year, month + 1, 0).day;

int _clampDay(int value, {required int min, required int max}) {
  if (value < min) return min;
  if (value > max) return max;
  return value;
}

(int, int) _windowAroundDay({
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
    start = (start - overflow).clamp(1, daysInMonth);
    end = daysInMonth;
  }

  return (start, end);
}
