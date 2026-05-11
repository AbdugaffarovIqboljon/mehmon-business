import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/formatters/uzbek_phone_input_formatter.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/controllers/guest_controller.dart';

class GuestFormSheet extends ConsumerStatefulWidget {
  const GuestFormSheet({super.key, this.existingGuest});

  final GuestEntity? existingGuest;

  @override
  ConsumerState<GuestFormSheet> createState() => _GuestFormSheetState();
}

class _GuestFormSheetState extends ConsumerState<GuestFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _notesController;
  late final TextEditingController _avatarUrlController;
  late final ValueNotifier<bool> _isLoading;

  bool get _isEditing => widget.existingGuest != null;

  @override
  void initState() {
    super.initState();
    final guest = widget.existingGuest;
    _nameController = TextEditingController(text: guest?.name ?? '');
    _emailController = TextEditingController(text: guest?.email ?? '');
    _notesController = TextEditingController(text: guest?.notes ?? '');
    _avatarUrlController = TextEditingController(text: guest?.avatarUrl ?? '');
    _phoneController = TextEditingController();
    _isLoading = ValueNotifier(false);

    if (guest != null) {
      final localDigits = UzbekPhoneInput.extractLocalDigits(guest.phone);
      _phoneController.text = UzbekPhoneInput.formatLocalDigits(localDigits);
    } else {
      UzbekPhoneInput.seedController(_phoneController);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    _avatarUrlController.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final name = _nameController.text.trim();
    final phone = UzbekPhoneInput.toE164(_phoneController.text);
    final email = _emailController.text.trim();
    final notes = _notesController.text.trim();
    final avatarUrl = _avatarUrlController.text.trim();

    _isLoading.value = true;

    final bool ok;
    if (_isEditing) {
      ok = await ref.read(guestControllerProvider.notifier).updateGuest(
            id: widget.existingGuest!.id,
            name: name,
            phone: phone,
            email: email.isEmpty ? null : email,
            notes: notes.isEmpty ? null : notes,
            avatarUrl: avatarUrl.isEmpty ? null : avatarUrl,
          );
    } else {
      ok = await ref.read(guestControllerProvider.notifier).createGuest(
            name: name,
            phone: phone,
            email: email.isEmpty ? null : email,
            notes: notes.isEmpty ? null : notes,
            avatarUrl: avatarUrl.isEmpty ? null : avatarUrl,
          );
    }

    if (!mounted) return;
    _isLoading.value = false;

    if (ok) {
      await ref.read(guestControllerProvider.notifier).refresh();
      if (!mounted) return;
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saqlashda xatolik yuz berdi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Handle(),
                const SizedBox(height: AppSpacing.md),
                Text(
                  _isEditing ? 'Tahrirlash' : 'Yangi mehmon',
                  style: AppTextStyles.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _nameController,
                  label: 'Ism *',
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Ism majburiy' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _phoneController,
                  label: 'Telefon *',
                  keyboardType: TextInputType.phone,
                  inputFormatters: UzbekPhoneInput.inputFormatters,
                  textInputAction: TextInputAction.next,
                  validator: (v) => UzbekPhoneInput.isValid(v)
                      ? null
                      : "Telefon raqamini to'liq kiriting",
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _notesController,
                  label: 'Izoh',
                  maxLines: 2,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _avatarUrlController,
                  label: 'Avatar URL',
                  hint: 'https://...',
                  keyboardType: TextInputType.url,
                ),
                const SizedBox(height: AppSpacing.xl),
                ValueListenableBuilder<bool>(
                  valueListenable: _isLoading,
                  builder: (_, loading, __) => PrimaryButton(
                    label: 'Saqlash',
                    isLoading: loading,
                    onPressed: loading ? null : _submit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.divider,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),
    );
  }
}
