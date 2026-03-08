import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/widgets/auth_form_section.dart';
import 'package:mehmon/features/auth/presentation/widgets/restaurant_photo_picker.dart';
import 'package:mehmon/features/auth/presentation/widgets/restaurant_type_dropdown.dart';
import 'package:mehmon/features/auth/presentation/widgets/working_hours_picker_row.dart';

import 'package:mehmon/l10n/app_localizations.dart';

class RestaurantProfilePage extends StatefulWidget {
  const RestaurantProfilePage({super.key});

  @override
  State<RestaurantProfilePage> createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  final _addressController = TextEditingController();
  final _imagePicker = ImagePicker();

  Uint8List? _restaurantImageBytes;
  String? _restaurantType;
  TimeOfDay? _openingTime;
  TimeOfDay? _closingTime;

  List<String> _getRestaurantTypes(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      loc.restTypeCafe,
      loc.restTypeRestaurant,
      loc.restTypeFastfood,
      loc.restTypeChayhana,
    ];
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickRestaurantImage() async {
    try {
      final selectedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 88,
        maxWidth: 1800,
      );
      if (selectedFile == null) {
        return;
      }

      final bytes = await selectedFile.readAsBytes();
      if (!mounted) {
        return;
      }
      setState(() => _restaurantImageBytes = bytes);
    } on Exception {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.photoPickerError)),
      );
    }
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    context.goNamed(RouteNames.floor);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final restaurantTypes = _getRestaurantTypes(context);

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
                RestaurantPhotoPicker(
                  imageBytes: _restaurantImageBytes,
                  placeholderText: loc.photoPlaceholder,
                  onTap: _pickRestaurantImage,
                ),
                const SizedBox(height: AppSpacing.xxl),
                RestaurantTypeDropdown(
                  items: restaurantTypes,
                  hintText: loc.restaurantTypeHint,
                  value: _restaurantType,
                  onChanged: (value) => setState(() => _restaurantType = value),
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
          child: PrimaryButton(label: loc.profileRegisterBtn, onPressed: _submit),
        ),
      ),
    );
  }
}
