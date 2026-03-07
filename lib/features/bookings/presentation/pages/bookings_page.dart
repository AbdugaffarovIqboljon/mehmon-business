import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_view_controller.dart';
import 'package:mehmon/features/bookings/presentation/widgets/book_a_table_sheet.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_calendar_handle.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_strip.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_list_section.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_month_calendar.dart';
import 'package:mehmon/features/bookings/presentation/widgets/bookings_fab.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      usePadding: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          right: AppSpacing.sm,
          bottom: AppSpacing.sm,
        ),
        child: BookingsFab(
          onPressed: () async {
            final payload = await showBookATableSheet(context);
            if (payload == null) return;
          },
        ),
      ),
      body: const _BookingsBody(),
    );
  }
}

class _BookingsBody extends ConsumerWidget {
  const _BookingsBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCalendarExpanded = ref.watch(
      bookingViewControllerProvider.select((state) => state.isCalendarExpanded),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxTopHeight = math.max(164, constraints.maxHeight - 140);
        final desiredTopHeight = isCalendarExpanded
            ? (constraints.maxHeight * 0.58).clamp(300, 420).toDouble()
            : 204.0;
        final topSectionHeight =
            math.min(maxTopHeight, desiredTopHeight).toDouble();

        return Column(
          children: [
            const SizedBox(height: AppSpacing.xs),
            SizedBox(
              height: topSectionHeight,
              child: _BookingCalendarSection(isExpanded: isCalendarExpanded),
            ),
            Expanded(
              child: RepaintBoundary(
                child: _BookingsListSection(
                  isCalendarExpanded: isCalendarExpanded,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BookingCalendarSection extends ConsumerWidget {
  const _BookingCalendarSection({required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(
      bookingViewControllerProvider.select((state) => state.selectedDate),
    );
    final viewController = ref.read(bookingViewControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              child: isExpanded
                  ? BookingMonthCalendar(
                      key: const ValueKey('booking-month-calendar'),
                      focusedMonth: ref.watch(
                        bookingViewControllerProvider.select(
                          (state) => state.focusedMonth,
                        ),
                      ),
                      selectedDate: selectedDate,
                      bookingCountsByDay: ref.watch(bookingCountsByDayProvider),
                      onDateSelected: (date) {
                        viewController.selectDate(date, collapseCalendar: true);
                      },
                      onPreviousMonth: viewController.showPreviousMonth,
                      onNextMonth: viewController.showNextMonth,
                    )
                  : BookingDateStrip(
                      key: const ValueKey('booking-date-strip'),
                      dates: ref.watch(bookingDateStripProvider),
                      selectedDate: selectedDate,
                      onExpandRequested: viewController.expandCalendar,
                      onDateTap: (date) {
                        if (DateUtils.isSameDay(date, selectedDate)) {
                          viewController.expandCalendar();
                          return;
                        }
                        viewController.selectDate(date);
                      },
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          BookingCalendarHandle(
            isExpanded: isExpanded,
            onTap: viewController.toggleCalendar,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

class _BookingsListSection extends ConsumerWidget {
  const _BookingsListSection({required this.isCalendarExpanded});

  final bool isCalendarExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsAsync = ref.watch(bookingControllerProvider);

    return bookingsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _BookingListError(
        error: error,
        onRetry: ref.read(bookingControllerProvider.notifier).refresh,
      ),
      data: (_) {
        final selectedDate = ref.watch(
          bookingViewControllerProvider.select((state) => state.selectedDate),
        );
        final selectedDayBookings = ref.watch(selectedDayBookingsProvider);
        return BookingListSection(
          bookings: selectedDayBookings,
          selectedDate: selectedDate,
          topPadding: isCalendarExpanded ? AppSpacing.sm : AppSpacing.xs,
        );
      },
    );
  }
}

class _BookingListError extends StatelessWidget {
  const _BookingListError({
    required this.error,
    required this.onRetry,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Не удалось загрузить брони',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '$error',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Повторить',
            onPressed: onRetry,
            expand: false,
          ),
        ],
      ),
    );
  }
}
