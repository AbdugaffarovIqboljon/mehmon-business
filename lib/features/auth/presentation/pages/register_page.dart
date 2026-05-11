import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/formatters/uzbek_phone_input_formatter.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';

import 'package:mehmon/l10n/app_localizations.dart';

// ── Register Page strings ─────────────────────────────────────────────────
const _kLogoPath = 'assets/images/img_app_logo.png';

/// Register screen with restaurant name, user name, and phone fields.
///
/// Calls [AuthController.registerByPhone] and navigates to profile setup.
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _restaurantController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVisible = ValueNotifier<bool>(false);
  String _lastPhoneValue = UzbekPhoneInput.countryCode;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    UzbekPhoneInput.seedController(_phoneController);
    _lastPhoneValue = _phoneController.text;
  }

  @override
  void dispose() {
    _restaurantController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordVisible.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    try {
      await ref
          .read(authControllerProvider.notifier)
          .registerByPhone(
            name: _nameController.text.trim(),
            phone: UzbekPhoneInput.toE164(_phoneController.text),
            cafeName: _restaurantController.text.trim(),
            password: _passwordController.text,
          );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }

    if (!mounted) return;
    ref
        .read(authControllerProvider)
        .whenOrNull(
          data: (entity) {
            if (entity != null) {
              context.pushNamed(RouteNames.profileSetup);
            }
          },
          error: (err, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(err.toString()),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
  }

  void _onPhoneChanged(String value) {
    if (UzbekPhoneInput.justCompleted(
      previousValue: _lastPhoneValue,
      currentValue: value,
    )) {
      FocusScope.of(context).unfocus();
    }
    _lastPhoneValue = value;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading || _isSubmitting;

    return AppScaffold(
      showAppBar: false,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.xxxl),

                        // ── Logo ───────────────────────────────────────
                        Center(
                          child: Image.asset(
                            _kLogoPath,
                            height: 88,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.home_work_rounded, size: 88),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxl),

                        // ── Title ──────────────────────────────────────
                        Center(
                          child: Text(
                            loc.registerTitle,
                            style: AppTextStyles.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // ── Restaurant name field ─────────────────────
                        AppTextField(
                          controller: _restaurantController,
                          textInputAction: TextInputAction.next,
                          label: loc.restaurantLabel,
                          hint: loc.restaurantHint,
                          enabled: !isLoading,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? loc.restaurantValidationError
                              : null,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── User name field ───────────────────────────
                        AppTextField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          label: loc.nameLabel,
                          hint: loc.nameHint,
                          enabled: !isLoading,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? loc.nameValidationError
                              : null,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── Phone field ───────────────────────────────
                        AppTextField(
                          controller: _phoneController,
                          label: loc.phoneLabel,
                          hint: loc.phoneHint,
                          keyboardType: TextInputType.phone,
                          inputFormatters: UzbekPhoneInput.inputFormatters,
                          onChanged: _onPhoneChanged,
                          enabled: !isLoading,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return loc.phoneValidationError;
                            }
                            if (!UzbekPhoneInput.isValid(v)) {
                              return loc.phoneInvalidError;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── Password field ────────────────────────────
                        ValueListenableBuilder<bool>(
                          valueListenable: _passwordVisible,
                          builder: (context, visible, _) => AppTextField(
                            controller: _passwordController,
                            label: 'Parol',
                            hint: 'Parolni kiriting',
                            obscureText: !visible,
                            enabled: !isLoading,
                            suffixIcon: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.textSecondary,
                              ),
                              onPressed: () =>
                                  _passwordVisible.value = !visible,
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Parolni kiriting';
                              if (v.length < 4) return "Parol kamida 4 ta belgidan iborat bo'lishi kerak";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // ── CTA button ──────────────────────────────
                        PrimaryButton(
                          label: loc.continueBtn,
                          isLoading: isLoading,
                          onPressed: isLoading ? null : _submit,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── "Already have account?" row ─────────────
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                loc.alreadyHaveAccount,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              GestureDetector(
                                onTap: isLoading
                                    ? null
                                    : () => context.goNamed(RouteNames.login),
                                child: Text(
                                  loc.loginLink,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
