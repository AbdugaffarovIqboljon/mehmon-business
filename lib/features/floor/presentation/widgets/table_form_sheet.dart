import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class TableFormSheet extends ConsumerStatefulWidget {
  const TableFormSheet({super.key, this.existingTable});

  final FloorEntity? existingTable;

  @override
  ConsumerState<TableFormSheet> createState() => _TableFormSheetState();
}

class _TableFormSheetState extends ConsumerState<TableFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _numberCtrl;
  late final TextEditingController _capacityCtrl;
  late final TextEditingController _locationCtrl;
  late final ValueNotifier<bool> _isLoading;
  String? _selectedZone;

  bool get _isEdit => widget.existingTable != null;

  @override
  void initState() {
    super.initState();
    final t = widget.existingTable;
    _numberCtrl = TextEditingController(text: t?.number);
    _capacityCtrl = TextEditingController(
      text: t != null ? t.capacity.toString() : '',
    );
    _locationCtrl = TextEditingController(text: t?.location);
    _selectedZone = t?.location;
    _isLoading = ValueNotifier(false);
  }

  @override
  void dispose() {
    _numberCtrl.dispose();
    _capacityCtrl.dispose();
    _locationCtrl.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final l10n = AppLocalizations.of(context)!;

    final number = _numberCtrl.text.trim();
    final capacity = int.parse(_capacityCtrl.text.trim());
    final location =
        (_selectedZone?.trim().isNotEmpty ?? false)
            ? _selectedZone!.trim()
            : _locationCtrl.text.trim();

    _isLoading.value = true;

    final bool ok;
    if (_isEdit) {
      ok = await ref.read(floorControllerProvider.notifier).updateTable(
            id: widget.existingTable!.id,
            number: number,
            capacity: capacity,
            location: location,
          );
    } else {
      ok = await ref.read(floorControllerProvider.notifier).createTable(
            number: number,
            capacity: capacity,
            location: location,
          );
    }

    if (!mounted) return;
    _isLoading.value = false;

    if (ok) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.floor_save_error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final zones =
        ref.watch(profileControllerProvider).valueOrNull?.zones ?? const [];
    // Pre-existing location that isn't a known zone (e.g. legacy free-text
    // value) — keep it as a selectable option so editing doesn't silently
    // drop the value.
    final dropdownValue =
        (_selectedZone != null && zones.contains(_selectedZone))
            ? _selectedZone
            : null;

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
                const _SheetHandle(),
                const SizedBox(height: AppSpacing.md),
                Text(
                  _isEdit ? l10n.floor_edit_table_title : l10n.floor_new_table_title,
                  style: AppTextStyles.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _numberCtrl,
                  label: l10n.floor_table_number_label,
                  hint: 'T-001',
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? l10n.floor_required_field : null,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _capacityCtrl,
                  label: l10n.floor_capacity_label,
                  hint: '4',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return l10n.floor_required_field;
                    final n = int.tryParse(v.trim());
                    if (n == null || n < 1) return l10n.floor_positive_number_error;
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                if (zones.isEmpty)
                  AppTextField(
                    controller: _locationCtrl,
                    label: l10n.floor_location_label,
                    hint: l10n.floor_location_hint,
                  )
                else
                  DropdownButtonFormField<String>(
                    initialValue: dropdownValue,
                    decoration: InputDecoration(
                      labelText: l10n.floor_zone_label,
                      hintText: l10n.floor_zone_hint,
                    ),
                    items: [
                      for (final z in zones)
                        DropdownMenuItem<String>(value: z, child: Text(z)),
                    ],
                    onChanged: (value) {
                      setState(() => _selectedZone = value);
                    },
                    validator: (value) =>
                        (value == null || value.isEmpty) ? l10n.floor_required_field : null,
                  ),
                const SizedBox(height: AppSpacing.xl),
                ValueListenableBuilder<bool>(
                  valueListenable: _isLoading,
                  builder: (_, loading, __) => PrimaryButton(
                    label: l10n.saveBtn,
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

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

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
