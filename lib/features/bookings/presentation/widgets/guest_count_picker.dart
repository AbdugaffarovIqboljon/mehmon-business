import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class GuestCountPicker extends StatelessWidget {
  const GuestCountPicker({
    required this.guestCount,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
    this.minGuests = 1,
  });

  final int guestCount;
  final int minGuests;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final canDecrement = guestCount > minGuests;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCounterButton(
              context: context,
              icon: Icons.remove_rounded,
              onTap: canDecrement ? onDecrement : null,
            ),
            const SizedBox(width: AppSpacing.lg),
            Text(
              '$guestCount',
              style: textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            _buildCounterButton(
              context: context,
              icon: Icons.add_rounded,
              onTap: onIncrement,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return SizedBox.square(
      dimension: 34,
      child: Material(
        color: Colors.transparent,
        child: InkResponse(
          onTap: onTap,
          radius: 18,
          customBorder: const CircleBorder(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: onTap == null ? 0.45 : 1),
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 22,
              color: Colors.white.withValues(alpha: onTap == null ? 0.45 : 1),
            ),
          ),
        ),
      ),
    );
  }
}
