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

// ── Restaurant Profile Page strings ────────────────────────────────────────
const _kTitle = 'Заполните профиль ресторана';
const _kPhotoPlaceholder = 'Загрузите фото ресторана';
const _kRestaurantTypeHint = 'Выберите тип заведения';
const _kAddressLabel = 'Manzil';
const _kAddressHint = 'Manzilni kiriting';
const _kWorkingHoursLabel = 'Ish vaqti';
const _kOpenTimeHint = 'Ochilish vaqti';
const _kCloseTimeHint = 'Yopilish vaqti';
const _kButtonLabel = 'Зарегистрироваться';
const _kPhotoPickerError = 'Не удалось открыть галерею';

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

  static const List<String> _restaurantTypes = [
    'Кафе',
    'Ресторан',
    'Фастфуд',
    'Чайхана',
  ];

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(_kPhotoPickerError)));
    }
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    context.goNamed(RouteNames.floor);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

    return AppScaffold(
      title: _kTitle,
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
                  placeholderText: _kPhotoPlaceholder,
                  onTap: _pickRestaurantImage,
                ),
                const SizedBox(height: AppSpacing.xxl),
                RestaurantTypeDropdown(
                  items: _restaurantTypes,
                  hintText: _kRestaurantTypeHint,
                  value: _restaurantType,
                  onChanged: (value) => setState(() => _restaurantType = value),
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _addressController,
                  label: _kAddressLabel,
                  hint: _kAddressHint,
                ),
                const SizedBox(height: AppSpacing.lg),
                AuthFormSection(
                  title: _kWorkingHoursLabel,
                  bottomSpacing: 0,
                  child: WorkingHoursPickerRow(
                    openingTime: _openingTime,
                    closingTime: _closingTime,
                    openingHintText: _kOpenTimeHint,
                    closingHintText: _kCloseTimeHint,
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
          child: PrimaryButton(label: _kButtonLabel, onPressed: _submit),
        ),
      ),
    );
  }
}
