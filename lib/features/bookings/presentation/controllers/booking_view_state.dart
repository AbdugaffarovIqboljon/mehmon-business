import 'package:flutter/material.dart';

@immutable
class BookingViewState {
  const BookingViewState({
    required this.selectedDate,
    required this.focusedMonth,
    required this.isCalendarExpanded,
  });

  factory BookingViewState.initial() {
    final today = DateUtils.dateOnly(DateTime.now());
    return BookingViewState(
      selectedDate: today,
      focusedMonth: DateTime(today.year, today.month),
      isCalendarExpanded: false,
    );
  }

  final DateTime selectedDate;
  final DateTime focusedMonth;
  final bool isCalendarExpanded;

  BookingViewState copyWith({
    DateTime? selectedDate,
    DateTime? focusedMonth,
    bool? isCalendarExpanded,
  }) {
    return BookingViewState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedMonth: focusedMonth ?? this.focusedMonth,
      isCalendarExpanded: isCalendarExpanded ?? this.isCalendarExpanded,
    );
  }
}
