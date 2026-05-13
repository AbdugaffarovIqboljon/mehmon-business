import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/local/locale_provider.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/widgets/language_option_tile.dart';
import 'package:mehmon/l10n/app_localizations.dart';

// ── Language Selection strings ────────────────────────────────────────────
const _kLogoPath = 'assets/images/img_app_logo.png';

class LanguageSelectPage extends ConsumerStatefulWidget {
  const LanguageSelectPage({super.key});

  @override
  ConsumerState<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends ConsumerState<LanguageSelectPage> {
  String? _selectedLanguageCode;

  List<Map<String, String>> _getLanguages(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      {'code': 'uz', 'name': loc.languageUz},
      {'code': 'ru', 'name': loc.languageRu},
      {'code': 'en', 'name': loc.languageEn},
    ];
  }

  void _onLanguageSelected(String code) {
    setState(() {
      _selectedLanguageCode = code;
    });
  }

  Future<void> _onContinue() async {
    if (_selectedLanguageCode != null) {
      await ref.read(localeProvider.notifier).setLocale(_selectedLanguageCode!);
      await ref
          .read(sharedPreferencesProvider)
          .setBool(kHasSelectedLanguage, true);
      if (mounted) {
        context.goNamed(RouteNames.onboarding);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final languages = _getLanguages(context);

    return AppScaffold(
      showAppBar: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: AppSpacing.xxl),
              child: Column(
                children: [
                  // ── Top section: logo + app name ─────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_kLogoPath, height: 64, fit: BoxFit.contain),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'MEHMON',
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // ── Languages list ───────────────────────────────────────
                  Column(
                    children: languages.map((lang) {
                      return LanguageOptionTile(
                        title: lang['name']!,
                        isSelected: _selectedLanguageCode == lang['code'],
                        onTap: () => _onLanguageSelected(lang['code']!),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // ── Bottom: CTA button ───────────────────────────────────────────
          PrimaryButton(
            label: lookupAppLocalizations(Locale(_selectedLanguageCode ?? 'uz')).continueBtn,
            onPressed: _selectedLanguageCode == null ? null : _onContinue,
          ),
        ],
      ),
    );
  }
}
