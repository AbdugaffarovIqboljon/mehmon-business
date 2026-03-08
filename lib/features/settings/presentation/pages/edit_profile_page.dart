import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
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

class EditProfileResult {
  const EditProfileResult({
    required this.name,
    required this.phone,
    required this.address,
  });

  final String name;
  final String phone;
  final String address;
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({required this.initialData, super.key});

  final EditProfileInitialData initialData;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialData.name);
    _phoneController = TextEditingController(text: widget.initialData.phone);
    _addressController = TextEditingController(text: widget.initialData.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.pop(
      EditProfileResult(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
      ),
    );
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
                AppTextField(
                  controller: _nameController,
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
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _addressController,
                  label: loc.addressLabel,
                  hint: loc.addressHint,
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: PrimaryButton(label: loc.saveBtn, onPressed: _save),
        ),
      ),
    );
  }
}
