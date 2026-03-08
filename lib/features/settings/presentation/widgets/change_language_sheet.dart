import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/l10n/app_localizations.dart';

typedef LanguageSelectedCallback = Future<void> Function(String languageCode);

Future<void> showChangeLanguageSheet({
  required BuildContext context,
  required String currentLanguageCode,
  required LanguageSelectedCallback onLanguageSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return _ChangeLanguageSheet(
        currentLanguageCode: currentLanguageCode,
        onLanguageSelected: onLanguageSelected,
      );
    },
  );
}

class _ChangeLanguageSheet extends StatelessWidget {
  const _ChangeLanguageSheet({
    required this.currentLanguageCode,
    required this.onLanguageSelected,
  });

  final String currentLanguageCode;
  final LanguageSelectedCallback onLanguageSelected;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final options = <_LanguageOption>[
      _LanguageOption(code: 'uz', label: loc.languageUz),
      _LanguageOption(code: 'ru', label: loc.languageRu),
      _LanguageOption(code: 'en', label: loc.languageEn),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.sm,
          0,
          AppSpacing.sm,
          AppSpacing.sm,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                loc.profileChangeLanguage,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              for (final option in options)
                _LanguageOptionTile(
                  option: option,
                  isSelected: option.code == currentLanguageCode,
                  onTap: () async {
                    if (option.code != currentLanguageCode) {
                      await onLanguageSelected(option.code);
                    }
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOptionTile extends StatelessWidget {
  const _LanguageOptionTile({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final _LanguageOption option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  option.label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_rounded,
                  color: AppColors.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOption {
  const _LanguageOption({required this.code, required this.label});

  final String code;
  final String label;
}
