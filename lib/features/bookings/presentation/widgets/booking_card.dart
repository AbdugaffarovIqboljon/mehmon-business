import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({required this.booking, super.key});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final timeLabel = booking.endTime != null
        ? '${booking.timeSlot}-${booking.endTime}'
        : booking.timeSlot;
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
                  timeLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF7F8BAA),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        letterSpacing: 0.1,
                      ),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz_rounded, color: Color(0xFF8E99B4)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              switch (booking.bookingType) {
                BookingType.standard => 'Standard',
                BookingType.banket => 'Banket',
                null => '',
              },
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFF27304A),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF93A0BC),
                    fontSize: 14,
                    height: 1.3,
                  ),
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
