import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_formatters.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({required this.booking, super.key});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final endTime = booking.dateTime.add(
      Duration(hours: booking.partySize >= 4 ? 2 : 1),
    );
    final subtitle = booking.notes?.trim().isNotEmpty ?? false
        ? booking.notes!
        : AppLocalizations.of(context)!.guestsCount(booking.partySize);
    final statusColor = _statusColor(booking.status);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: statusColor, width: 3),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  '${bookingTimeLabel(booking.dateTime)}-${bookingTimeLabel(endTime)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFF7F8BAA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz_rounded, color: Color(0xFF8E99B4)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              AppLocalizations.of(context)!.banquet,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF27304A),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: const Color(0xFF93A0BC)),
            ),
          ],
        ),
      ),
    );
  }
}

Color _statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'confirmed':
      return const Color(0xFF0DB07D);
    case 'pending':
      return const Color(0xFF6A56E4);
    case 'cancelled':
      return const Color(0xFFED5B5B);
    default:
      return const Color(0xFF198EEA);
  }
}
