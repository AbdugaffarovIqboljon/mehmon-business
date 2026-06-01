import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

// Sentinel replaces null so PopupMenuButton<String> always fires onSelected.
const String _kAllZones = '__all__';

class ZoneFilterDropdown extends ConsumerWidget {
  const ZoneFilterDropdown({
    required this.zones,
    required this.isDisabled,
    super.key,
  });

  final List<String> zones;
  final bool isDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedZone = ref.watch(selectedZoneProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: PopupMenuButton<String>(
          enabled: !isDisabled,
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (String value) {
            if (value == _kAllZones) {
              ref.read(selectedZoneProvider.notifier).state = null;
              return;
            }
            final current = ref.read(selectedZoneProvider);
            ref.read(selectedZoneProvider.notifier).state =
                (value == current) ? null : value;
          },
          itemBuilder: (ctx) => [
            _buildMenuItem(l10n.floor_all_zones, _kAllZones,
                isSelected: selectedZone == null,),
            const PopupMenuDivider(height: 1),
            ...zones.map(
              (z) => _buildMenuItem(z, z, isSelected: z == selectedZone),
            ),
          ],
          child: _DropdownTrigger(
            label: selectedZone ?? l10n.floor_all_zones,
            isActive: selectedZone != null,
            isDisabled: isDisabled,
          ),
        ),
    );
  }
}

PopupMenuItem<String> _buildMenuItem(
  String label,
  String value, {
  required bool isSelected,
}) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        Icon(
          isSelected
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          size: 20,
          color: isSelected ? AppColors.primary : Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

class _DropdownTrigger extends StatelessWidget {
  const _DropdownTrigger({
    required this.label,
    required this.isActive,
    required this.isDisabled,
  });

  final String label;
  final bool isActive;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.4 : 1.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: isActive ? Colors.white : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
