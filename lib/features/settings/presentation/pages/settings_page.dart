import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/local/locale_provider.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mehmon/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:mehmon/features/settings/presentation/widgets/change_language_sheet.dart';
import 'package:mehmon/features/settings/presentation/widgets/profile_action_tile.dart';
import 'package:mehmon/features/settings/presentation/widgets/profile_header_card.dart';
import 'package:mehmon/l10n/app_localizations.dart';

/// Profile tab page with minimal profile and settings actions.
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isInitialized = false;
  bool _isLoggingOut = false;
  String _profileName = '';
  String _profilePhone = '';
  String _profileAddress = '';

  void _seedProfileValues({
    required AppLocalizations loc,
    required String? authName,
    required String? authPhone,
  }) {
    if (_isInitialized) return;
    _profileName = (authName?.trim().isNotEmpty ?? false)
        ? authName!.trim()
        : loc.appName;
    _profilePhone = authPhone?.trim() ?? '';
    _profileAddress = '';
    _isInitialized = true;
  }

  String _languageLabel(AppLocalizations loc, String code) {
    return switch (code) {
      'ru' => loc.languageRu,
      'en' => loc.languageEn,
      _ => loc.languageUz,
    };
  }

  Future<void> _openEditProfile() async {
    final result = await context.pushNamed(
      RouteNames.editProfile,
      extra: EditProfileInitialData(
        name: _profileName,
        phone: _profilePhone,
        address: _profileAddress,
      ),
    );
    if (result is! EditProfileResult || !mounted) return;
    setState(() {
      _profileName = result.name.trim();
      _profilePhone = result.phone.trim();
      _profileAddress = result.address.trim();
    });
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
      await ref.read(authControllerProvider.notifier).logout();
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
    final auth = ref.watch(authControllerProvider).asData?.value;
    final currentLanguageCode =
        ref.watch(localeProvider)?.languageCode ?? 'uz';

    _seedProfileValues(
      loc: loc,
      authName: auth?.name,
      authPhone: auth?.phone,
    );

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
              title: _profileName.isEmpty ? loc.appName : _profileName,
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
