import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/primary_button.dart';

// ── Intro Page strings ────────────────────────────────────────────────────
// Kept inline; do NOT introduce a localization framework yet.
const _kTitle = 'Управление залом\nв одном экране';
const _kSubtitle = 'Статусы столов, визиты - всё\nпод контролем.';
const _kButtonLabel = 'Davom etish';
const _kLogoPath = 'assets/images/img_app_logo.png';
const _kIntroPath = 'assets/images/img_app_intro.png';

// Special background required only on the Intro page (#FFF6EC).
const _kIntroBg = Color(0xFFFFF6EC);

/// Onboarding / intro screen shown before login.
///
/// Navigates to the Register page on CTA tap.
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      backgroundColor: _kIntroBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Top section: logo + text ─────────────────────────
          Column(
            children: [
              const SizedBox(height: AppSpacing.xxl),
              
              // App logo
              Row(
                mainAxisAlignment: .center,
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
                _kTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineLarge.copyWith(
                  height: 1.25,
                ),
              ),
              
              const SizedBox(height: AppSpacing.md),
              
              // Subtitle
              Text(
                _kSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: AppSpacing.xxxl),
              
              // Illustration
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppSpacing.radiusXl,
                ),
                child: Image.asset(
                  _kIntroPath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusXl,
                      ),
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
            label: _kButtonLabel,
            onPressed: () => context.goNamed(RouteNames.login),
          ),
        ],
      ),
    );
  }
}
