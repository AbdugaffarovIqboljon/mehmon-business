import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';

/// Placeholder register page — UI will be replaced with Figma design later.
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return AppScaffold(
      title: 'Register',
      showAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Account',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSpacing.xxxl),
            const AppTextField(label: 'Full Name', hint: 'John Doe'),
            const SizedBox(height: AppSpacing.lg),
            const AppTextField(
              label: 'Email',
              hint: 'staff@mehmon.app',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.lg),
            const AppTextField(
              label: 'Password',
              hint: '••••••••',
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Register',
              isLoading: authState.isLoading,
              onPressed: () {
                ref
                    .read(authControllerProvider.notifier)
                    .register(
                      name: 'Demo User',
                      email: 'demo@mehmon.app',
                      password: 'demo',
                    );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => context.goNamed(RouteNames.login),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
