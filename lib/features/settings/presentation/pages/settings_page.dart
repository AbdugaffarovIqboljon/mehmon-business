import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/local/locale_provider.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/features/settings/presentation/widgets/change_language_sheet.dart';
import 'package:mehmon/features/settings/presentation/widgets/profile_action_tile.dart';
import 'package:mehmon/features/settings/presentation/widgets/profile_header_card.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isLoggingOut = false;

  String _languageLabel(AppLocalizations loc, String code) {
    return switch (code) {
      'ru' => loc.languageRu,
      'en' => loc.languageEn,
      _ => loc.languageUz,
    };
  }

  Future<void> _openEditProfile() async {
    await context.pushNamed(RouteNames.editProfile);
  }

  Future<void> _openLanguageSheet(String currentLanguageCode) async {
    await showChangeLanguageSheet(
      context: context,
      currentLanguageCode: currentLanguageCode,
      onLanguageSelected: (code) async {
        await ref.read(localeProvider.notifier).setLocale(code);
      },
    );
  }

  void _openAboutUs() {
    context.pushNamed(RouteNames.aboutUs);
  }

  Future<void> _logout() async {
    if (_isLoggingOut) return;
    setState(() => _isLoggingOut = true);
    try {
      await ref.read(profileControllerProvider.notifier).logout();
      if (mounted) {
        context.goNamed(RouteNames.login);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoggingOut = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final profile = ref.watch(profileControllerProvider).valueOrNull;
    final currentLanguageCode =
        ref.watch(localeProvider)?.languageCode ?? 'uz';

    return AppScaffold(
      showAppBar: false,
      usePadding: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.xl,
          AppSpacing.lg,
          AppSpacing.xl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                loc.tabProfile,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            ProfileHeaderCard(
              title: (profile?.cafeName.isNotEmpty ?? false)
                  ? profile!.cafeName
                  : loc.appName,
              subtitle: loc.profileSubtitle,
            ),
            const SizedBox(height: AppSpacing.xl),
            ProfileActionTile(
              title: loc.profileEditProfile,
              icon: Icons.edit_outlined,
              onTap: _openEditProfile,
            ),
            const SizedBox(height: AppSpacing.md),
            ProfileActionTile(
              title: loc.profileChangeLanguage,
              icon: Icons.language_rounded,
              trailingText: _languageLabel(loc, currentLanguageCode),
              onTap: () => _openLanguageSheet(currentLanguageCode),
            ),
            const SizedBox(height: AppSpacing.md),
            ProfileActionTile(
              title: loc.profileAboutUs,
              icon: Icons.info_outline_rounded,
              onTap: _openAboutUs,
            ),
            const SizedBox(height: AppSpacing.md),
            ProfileActionTile(
              title: loc.logout,
              icon: Icons.logout_rounded,
              onTap: _logout,
              isDestructive: true,
              isLoading: _isLoggingOut,
              showChevron: false,
            ),
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: Text(
                '${loc.appName} V1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
