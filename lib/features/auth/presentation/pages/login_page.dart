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

// ── Login Page strings ────────────────────────────────────────────────────
const _kLogoPath = 'assets/images/img_app_logo.png';

/// Login screen with name + phone fields.
///
/// Calls [AuthController.loginByPhone] and navigates to the floor on success.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
          .loginByPhone(
            phone: UzbekPhoneInput.toE164(_phoneController.text),
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
              context.goNamed(RouteNames.floor);
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
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      showAppBar: false,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.xxl),

                        // ── Top section: logo + title ───────────────
                        Center(
                          child: Image.asset(
                            _kLogoPath,
                            height: 190,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.home_work_rounded, size: 96),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        Center(
                          child: Text(
                            loc.loginTitle,
                            textAlign: TextAlign.center,
                            style: textTheme.headlineLarge,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // ── Phone field ────────────────────────────
                        Text(loc.phoneLabel, style: textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.sm),
                        AppTextField(
                          controller: _phoneController,
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

                        // ── Password field ─────────────────────────
                        Text('Parol', style: textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.sm),
                        ValueListenableBuilder<bool>(
                          valueListenable: _passwordVisible,
                          builder: (context, visible, _) => AppTextField(
                            controller: _passwordController,
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

                        const Spacer(),

                        // ── Bottom section: CTA + register link ────
                        PrimaryButton(
                          label: loc.loginBtn,
                          isLoading: isLoading,
                          onPressed: isLoading ? null : _submit,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // New to app? Register link
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                loc.newToApp,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              GestureDetector(
                                onTap: isLoading
                                    ? null
                                    : () =>
                                          context.goNamed(RouteNames.register),
                                child: Text(
                                  loc.registerLink,
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
