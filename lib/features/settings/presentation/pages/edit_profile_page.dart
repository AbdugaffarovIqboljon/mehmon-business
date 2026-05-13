import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/formatters/uzbek_phone_input_formatter.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/image_picker_button.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/auth/presentation/widgets/restaurant_type_dropdown.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class EditProfileInitialData {
  const EditProfileInitialData({
    this.name = '',
    this.phone = '',
    this.address = '',
  });

  final String name;
  final String phone;
  final String address;
}

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({required this.initialData, super.key});

  final EditProfileInitialData initialData;

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _cafeNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _openingController;
  late final TextEditingController _closingController;
  late final TextEditingController _imageUrlController;
  String? _selectedInstitutionType;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileControllerProvider).valueOrNull;
    _nameController =
        TextEditingController(text: profile?.name ?? widget.initialData.name);
    _cafeNameController =
        TextEditingController(text: profile?.cafeName ?? '');
    _phoneController = TextEditingController(
        text: profile?.phone ?? widget.initialData.phone);
    _addressController = TextEditingController(
        text: profile?.address ?? widget.initialData.address);
    _openingController =
        TextEditingController(text: profile?.openingTime ?? '');
    _closingController =
        TextEditingController(text: profile?.closingTime ?? '');
    _imageUrlController =
        TextEditingController(text: profile?.imageUrl ?? '');
    _selectedInstitutionType = profile?.institutionType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cafeNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _openingController.dispose();
    _closingController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _pickTime(TextEditingController controller) async {
    final parts = controller.text.split(':');
    final initialTime = parts.length == 2
        ? TimeOfDay(
            hour: int.tryParse(parts[0]) ?? TimeOfDay.now().hour,
            minute: int.tryParse(parts[1]) ?? TimeOfDay.now().minute,
          )
        : TimeOfDay.now();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      controller.text =
          '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
    }
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    setState(() => _isSaving = true);
    try {
      final phone = UzbekPhoneInput.toE164(_phoneController.text.trim());
      final success = await ref
          .read(profileControllerProvider.notifier)
          .updateProfile(
            name: _nameController.text.trim(),
            phone: phone,
            cafeName: _cafeNameController.text.trim(),
            address: _addressController.text.trim().isEmpty
                ? null
                : _addressController.text.trim(),
            openingTime: _openingController.text.trim().isEmpty
                ? null
                : _openingController.text.trim(),
            closingTime: _closingController.text.trim().isEmpty
                ? null
                : _closingController.text.trim(),
            imageUrl: _imageUrlController.text.trim().isEmpty
                ? null
                : _imageUrlController.text.trim(),
            institutionType: _selectedInstitutionType,
          );
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil yangilandi')),
        );
        if (mounted) context.pop();
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return AppScaffold(
      title: loc.profileEditProfile,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ImagePickerButton(
                    currentUrl: _imageUrlController.text.isEmpty
                        ? null
                        : _imageUrlController.text,
                    onUrlUploaded: (url) {
                      setState(() => _imageUrlController.text = url);
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                AppTextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  label: loc.nameLabel,
                  hint: loc.nameHint,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return loc.nameValidationError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _cafeNameController,
                  textInputAction: TextInputAction.next,
                  label: loc.restaurantLabel,
                  hint: loc.restaurantHint,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return loc.restaurantValidationError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  label: loc.phoneLabel,
                  hint: loc.phoneHint,
                  keyboardType: TextInputType.phone,
                  inputFormatters: UzbekPhoneInput.inputFormatters,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty)
                          ? 'Telefon raqamni kiriting'
                          : null,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _addressController,
                  textInputAction: TextInputAction.next,
                  label: loc.addressLabel,
                  hint: loc.addressHint,
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 3,
                ),
                const SizedBox(height: AppSpacing.lg),
                GestureDetector(
                  onTap: () => _pickTime(_openingController),
                  child: AbsorbPointer(
                    child: AppTextField(
                      controller: _openingController,
                      textInputAction: TextInputAction.next,
                      label: loc.workingHoursLabel,
                      hint: loc.openTimeHint,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                GestureDetector(
                  onTap: () => _pickTime(_closingController),
                  child: AbsorbPointer(
                    child: AppTextField(
                      controller: _closingController,
                      label: 'Yopilish vaqti',
                      hint: loc.closeTimeHint,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                RestaurantTypeDropdown(
                  selectedValue: _selectedInstitutionType,
                  onChanged: (key) =>
                      setState(() => _selectedInstitutionType = key),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: PrimaryButton(
            label: loc.saveBtn,
            onPressed: _isSaving ? null : _save,
            isLoading: _isSaving,
          ),
        ),
      ),
    );
  }
}
