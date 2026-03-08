import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class FloorDrawerHeader extends StatelessWidget {
  const FloorDrawerHeader({
    super.key,
    this.restaurantName = 'Safia Restaurant',
  });

  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: Color(0xFFCED0D4),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            restaurantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontSize: 40 / 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
