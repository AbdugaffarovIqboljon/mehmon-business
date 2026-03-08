import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/guests/presentation/controllers/guest_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class GuestsSegmentedControl extends StatelessWidget {
  const GuestsSegmentedControl({
    required this.selectedTab,
    required this.onTabChanged,
    super.key,
  });

  final GuestFilterTab selectedTab;
  final ValueChanged<GuestFilterTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE1D6),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SegmentButton(
              label: AppLocalizations.of(context)!.segmentAllGuests,
              isSelected: selectedTab == GuestFilterTab.allGuests,
              onTap: () => onTabChanged(GuestFilterTab.allGuests),
            ),
          ),
          Expanded(
            child: _SegmentButton(
              label: AppLocalizations.of(context)!.segmentGuestsInHall,
              isSelected: selectedTab == GuestFilterTab.inHall,
              onTap: () => onTabChanged(GuestFilterTab.inHall),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
