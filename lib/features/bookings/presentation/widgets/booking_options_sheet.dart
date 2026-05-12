import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/widgets/book_a_table_sheet.dart';

class BookingOptionsSheet extends ConsumerWidget {
  const BookingOptionsSheet({required this.booking, super.key});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final status = booking.status;
    final isTerminal = status == 'completed' || status == 'cancelled';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.sm,
                bottom: AppSpacing.md,
              ),
              child: Text(
                '${booking.guestName} · ${booking.timeSlot}',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Divider(height: 1, color: AppColors.divider),
            const SizedBox(height: AppSpacing.sm),
            if (isTerminal)
              _OptionTile(
                icon: Icons.close,
                label: 'Yopish',
                onTap: () => Navigator.pop(context),
              )
            else ...[
              _OptionTile(
                icon: Icons.edit_outlined,
                label: 'Tahrirlash',
                onTap: () {
                  Navigator.pop(context);
                  showBookATableSheet(
                    context,
                    existingBooking: booking,
                  );
                },
              ),
              if (status == 'pending')
                _OptionTile(
                  icon: Icons.check_circle_outline,
                  label: 'Tasdiqlash',
                  color: AppColors.success,
                  onTap: () => _confirmStatusChange(
                    context,
                    ref,
                    title: 'Bron tasdiqlansinmi?',
                    newStatus: 'confirmed',
                  ),
                ),
              if (status == 'confirmed')
                _OptionTile(
                  icon: Icons.task_alt,
                  label: 'Yakunlash',
                  color: AppColors.info,
                  onTap: () => _confirmStatusChange(
                    context,
                    ref,
                    title: 'Bron yakunlansinmi?',
                    newStatus: 'completed',
                  ),
                ),
              _OptionTile(
                icon: Icons.cancel_outlined,
                label: 'Bekor qilish',
                color: AppColors.error,
                onTap: () => _confirmStatusChange(
                  context,
                  ref,
                  title: 'Bron bekor qilinsinmi?',
                  newStatus: 'cancelled',
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmStatusChange(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String newStatus,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: AppTextStyles.titleLarge),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("Yo'q"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Ha'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final success = await ref
        .read(bookingControllerProvider.notifier)
        .updateBooking(
          id: booking.id,
          guestName: booking.guestName,
          phone: booking.phone,
          tableId: booking.tableInfo?.id ?? '',
          date: booking.date,
          timeSlot: booking.timeSlot,
          numberOfGuests: booking.numberOfGuests,
          status: newStatus,
          endTime: booking.endTime,
          bookingType: booking.bookingType?.apiValue,
          notes: booking.notes,
        );

    if (!context.mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? 'Bron yangilandi' : 'Xatolik yuz berdi'),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.textPrimary;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      leading: Icon(icon, color: effectiveColor),
      title: Text(
        label,
        style: AppTextStyles.titleMedium.copyWith(color: effectiveColor),
      ),
      onTap: onTap,
    );
  }
}
