import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_drawer_destination.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer_item.dart';

class FloorDrawerSectionBlock extends StatelessWidget {
  const FloorDrawerSectionBlock({
    required this.title,
    required this.destinations,
    required this.onDestinationTap,
    super.key,
  });

  final String title;
  final List<FloorDrawerDestination> destinations;
  final ValueChanged<FloorDrawerDestination> onDestinationTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 49 / 2,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Column(
            children: destinations
                .map(
                  (destination) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: FloorDrawerItem(
                      label: destination.title,
                      iconAsset: destination.iconAsset,
                      onTap: () => onDestinationTap(destination),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
