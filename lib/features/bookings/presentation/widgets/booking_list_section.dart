import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_card.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_formatters.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class BookingListSection extends StatelessWidget {
  const BookingListSection({
    required this.bookings,
    required this.selectedDate,
    this.topPadding = AppSpacing.xs,
    super.key,
  });

  final List<BookingEntity> bookings;
  final DateTime selectedDate;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                120,
              ),
              child: _BookingEmptyState(selectedDate: selectedDate),
            ),
          ),
        ],
      );
    }

    return RepaintBoundary(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.lg,
          topPadding,
          AppSpacing.lg,
          120,
        ),
        itemCount: bookings.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return BookingCard(booking: bookings[index]);
        },
      ),
    );
  }
}

class _BookingEmptyState extends StatelessWidget {
  const _BookingEmptyState({required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.event_busy_rounded,
                color: Color(0xFF9AA5BE),
                size: 34,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                AppLocalizations.of(context)!.noBookingsOn(
                  selectedDate.day.toString(),
                  bookingMonthShortLabel(context, selectedDate),
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF2E3755),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.3,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                AppLocalizations.of(context)!.addBookingHint,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF95A1BC),
                      fontSize: 14,
                      height: 1.35,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
