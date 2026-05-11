import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/widgets/auth_form_section.dart';
import 'package:mehmon/features/auth/presentation/widgets/restaurant_type_dropdown.dart';
import 'package:mehmon/features/auth/presentation/widgets/working_hours_picker_row.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';

import 'package:mehmon/l10n/app_localizations.dart';

class RestaurantProfilePage extends ConsumerStatefulWidget {
  const RestaurantProfilePage({super.key});

  @override
  ConsumerState<RestaurantProfilePage> createState() =>
      _RestaurantProfilePageState();
}

class _RestaurantProfilePageState
    extends ConsumerState<RestaurantProfilePage> {
  final _addressController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _isLoading = ValueNotifier<bool>(false);

  String? _restaurantType;
  TimeOfDay? _openingTime;
  TimeOfDay? _closingTime;

  @override
  void dispose() {
    _addressController.dispose();
    _imageUrlController.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  String _formatTime(TimeOfDay tod) =>
      '${tod.hour.toString().padLeft(2, '0')}:'
      '${tod.minute.toString().padLeft(2, '0')}';

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    final messenger = ScaffoldMessenger.of(context);

    final type = _restaurantType;
    final address = _addressController.text.trim();
    final opening = _openingTime;
    final closing = _closingTime;

    if (type == null ||
        address.isEmpty ||
        opening == null ||
        closing == null) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    final imageUrl = _imageUrlController.text.trim();

    _isLoading.value = true;
    final success =
        await ref.read(profileControllerProvider.notifier).updateProfile(
              institutionType: type,
              address: address,
              openingTime: _formatTime(opening),
              closingTime: _formatTime(closing),
              imageUrl: imageUrl.isEmpty ? null : imageUrl,
            );
    if (!mounted) return;
    _isLoading.value = false;

    if (success) {
      context.goNamed(RouteNames.floor);
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    return AppScaffold(
      title: loc.profileSetupTitle,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: keyboardInset),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  controller: _imageUrlController,
                  label: 'Rasm URL',
                  hint: 'https://...',
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.lg),
                RestaurantTypeDropdown(
                  selectedValue: _restaurantType,
                  onChanged: (key) => setState(() => _restaurantType = key),
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _addressController,
                  label: loc.addressLabel,
                  hint: loc.addressHint,
                ),
                const SizedBox(height: AppSpacing.lg),
                AuthFormSection(
                  title: loc.workingHoursLabel,
                  bottomSpacing: 0,
                  child: WorkingHoursPickerRow(
                    openingTime: _openingTime,
                    closingTime: _closingTime,
                    openingHintText: loc.openTimeHint,
                    closingHintText: loc.closeTimeHint,
                    onOpeningTimeChanged: (value) =>
                        setState(() => _openingTime = value),
                    onClosingTimeChanged: (value) =>
                        setState(() => _closingTime = value),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (_, loading, __) => PrimaryButton(
              label: loc.profileRegisterBtn,
              isLoading: loading,
              onPressed: loading ? null : _submit,
            ),
          ),
        ),
      ),
    );
  }
}
