import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/auth/presentation/widgets/auth_selection_field.dart';

class RestaurantTypeDropdown extends StatelessWidget {
  const RestaurantTypeDropdown({
    required this.items,
    required this.hintText,
    required this.onChanged,
    super.key,
    this.value,
    this.sheetTitle = 'Тип заведения',
  });

  /// Map of stable English key (e.g. `cafe`) → localized display label.
  final Map<String, String> items;
  final String hintText;

  /// Stable English key of the currently selected item, or `null`.
  final String? value;

  /// Emits the stable English key of the chosen item.
  final ValueChanged<String> onChanged;
  final String sheetTitle;

  Future<void> openSelectionSheet(BuildContext context) async {
    final entries = items.entries.toList();
    final selectedKey = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.lg,
                    AppSpacing.lg,
                    AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      Text(sheetTitle, style: AppTextStyles.titleLarge),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                    ),
                    itemCount: entries.length,
                    separatorBuilder: (_, __) =>
                        const Divider(color: AppColors.divider),
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      final isSelected = value == entry.key;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        title: Text(entry.value, style: AppTextStyles.bodyLarge),
                        trailing: isSelected
                            ? const Icon(
                                Icons.check_rounded,
                                color: AppColors.primary,
                              )
                            : null,
                        onTap: () => Navigator.of(context).pop(entry.key),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selectedKey != null) {
      onChanged(selectedKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedLabel = value == null ? null : items[value];
    return AuthSelectionField(
      text: selectedLabel ?? hintText,
      isPlaceholder: selectedLabel == null,
      onTap: () => openSelectionSheet(context),
    );
  }
}
