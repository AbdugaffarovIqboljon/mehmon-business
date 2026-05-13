import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/primary_button.dart';

import 'package:mehmon/l10n/app_localizations.dart';

// ── Intro Page strings ────────────────────────────────────────────────────
const _kLogoPath = 'assets/images/img_app_logo.png';
const _kIntroPath = 'assets/images/img_app_intro.png';

/// Onboarding / intro screen shown before login.
///
/// Navigates to the Register page on CTA tap.
class IntroPage extends ConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    
    return AppScaffold(
      showAppBar: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Top section: logo + text ─────────────────────────
          Column(
            children: [
              const SizedBox(height: AppSpacing.xxl),

              // App logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _kLogoPath,
                    height: 64,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.home_work_rounded,
                      size: 64,
                      color: AppColors.primary,
                    ),
                  ),
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

              const SizedBox(height: AppSpacing.xxl),

              // Title
              Text(
                loc.introTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineLarge.copyWith(height: 1.25),
              ),

              const SizedBox(height: AppSpacing.md),

              // Subtitle
              Text(
                loc.introSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: AppSpacing.xxxl),

              // Illustration
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                child: Image.asset(
                  _kIntroPath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 64,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Bottom: CTA button ───────────────────────────────
          PrimaryButton(
            label: loc.continueBtn,
            onPressed: () {
              ref
                  .read(sharedPreferencesProvider)
                  .setBool(kHasSeenOnboarding, true);
              context.goNamed(RouteNames.login);
            },
          ),
        ],
      ),
    );
  }
}
