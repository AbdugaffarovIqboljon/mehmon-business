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

// ── Register Page strings ─────────────────────────────────────────────────
// Kept inline; do NOT introduce a localization framework yet.
const _kTitle = 'Зарегистрироваться';
const _kRestaurantLabel = 'Kafe/Restoran nomi';
const _kRestaurantHint = 'Nomini kiriting';
const _kNameLabel = 'Ismingiz';
const _kNameHint = 'Ismingizni kiriting';
const _kPhoneLabel = 'Telefon raqami';
const _kPhoneHint = '+998 93 123 45 67';
const _kButtonLabel = 'Davom etish';
const _kHaveAccount = 'Уже есть аккаунт?';
const _kLoginLink = 'Войти';
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
            restaurantName: _restaurantController.text.trim(),
            name: _nameController.text.trim(),
            phone: UzbekPhoneInput.toE164(_phoneController.text),
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
                        const Center(
                          child: Text(
                            _kTitle,
                            style: AppTextStyles.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // ── Restaurant name field ─────────────────────
                        AppTextField(
                          controller: _restaurantController,
                          textInputAction: TextInputAction.next,
                          label: _kRestaurantLabel,
                          hint: _kRestaurantHint,
                          enabled: !isLoading,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Nomini kiriting'
                              : null,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── User name field ───────────────────────────
                        AppTextField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          label: _kNameLabel,
                          hint: _kNameHint,
                          enabled: !isLoading,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Ismingizni kiriting'
                              : null,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // ── Phone field ───────────────────────────────
                        AppTextField(
                          controller: _phoneController,
                          label: _kPhoneLabel,
                          hint: _kPhoneHint,
                          keyboardType: TextInputType.phone,
                          inputFormatters: UzbekPhoneInput.inputFormatters,
                          onChanged: _onPhoneChanged,
                          enabled: !isLoading,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Telefon raqamini kiriting';
                            }
                            if (!UzbekPhoneInput.isValid(v)) {
                              return "Telefon raqamni to'liq kiriting";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // ── CTA button ──────────────────────────────
                        PrimaryButton(
                          label: _kButtonLabel,
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
                                _kHaveAccount,
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
                                  _kLoginLink,
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
