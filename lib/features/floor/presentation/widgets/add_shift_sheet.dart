import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class AddShiftSheet extends ConsumerStatefulWidget {
  const AddShiftSheet({this.existingShift, super.key});

  final ShiftEntity? existingShift;

  @override
  ConsumerState<AddShiftSheet> createState() => _AddShiftSheetState();
}

class _AddShiftSheetState extends ConsumerState<AddShiftSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _staffNameCtrl;
  late final TextEditingController _notesCtrl;
  late final ValueNotifier<DateTime?> _date;
  late final ValueNotifier<TimeOfDay?> _startTime;
  late final ValueNotifier<TimeOfDay?> _endTime;
  late final ValueNotifier<List<String>> _selectedTableIds;
  late final ValueNotifier<bool> _submitting;

  bool get _isEdit => widget.existingShift != null;

  @override
  void initState() {
    super.initState();
    final shift = widget.existingShift;
    _staffNameCtrl = TextEditingController(text: shift?.staffName ?? '');
    _notesCtrl = TextEditingController(text: shift?.notes ?? '');
    _date = ValueNotifier(_parseDate(shift?.date));
    _startTime = ValueNotifier(_parseTime(shift?.startTime));
    _endTime = ValueNotifier(_parseTime(shift?.endTime));
    _selectedTableIds = ValueNotifier<List<String>>(
      shift?.assignedTables.map((t) => t.id).toList() ?? <String>[],
    );
    _submitting = ValueNotifier(false);
  }

  @override
  void dispose() {
    _staffNameCtrl.dispose();
    _notesCtrl.dispose();
    _date.dispose();
    _startTime.dispose();
    _endTime.dispose();
    _selectedTableIds.dispose();
    _submitting.dispose();
    super.dispose();
  }

  DateTime? _parseDate(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    return DateTime.tryParse(raw);
  }

  TimeOfDay? _parseTime(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    final parts = raw.split(':');
    if (parts.length < 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return null;
    return TimeOfDay(hour: h, minute: m);
  }

  String _formatDate(DateTime d) {
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$y-$m-$day';
  }

  String _formatTime(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date.value ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      _date.value = picked;
    }
  }

  Future<void> _pickTime(ValueNotifier<TimeOfDay?> target) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: target.value ?? TimeOfDay.now(),
    );
    if (picked != null) {
      target.value = picked;
    }
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final l10n = AppLocalizations.of(context)!;
    final date = _date.value;
    final start = _startTime.value;
    final end = _endTime.value;
    if (date == null || start == null || end == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.floor_select_date_time)),
      );
      return;
    }

    _submitting.value = true;
    final notes = _notesCtrl.text.trim();
    final controller = ref.read(shiftsControllerProvider.notifier);
    final bool ok;
    if (_isEdit) {
      ok = await controller.editShift(
        widget.existingShift!.id,
        staffName: _staffNameCtrl.text.trim(),
        startTime: _formatTime(start),
        endTime: _formatTime(end),
        date: _formatDate(date),
        notes: notes.isEmpty ? '' : notes,
        assignedTables: _selectedTableIds.value,
      );
    } else {
      ok = await controller.addShift(
        staffName: _staffNameCtrl.text.trim(),
        startTime: _formatTime(start),
        endTime: _formatTime(end),
        date: _formatDate(date),
        notes: notes.isEmpty ? null : notes,
        assignedTables: _selectedTableIds.value,
      );
    }
    if (!mounted) return;
    _submitting.value = false;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Handle(),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    _isEdit ? l10n.floor_edit_shift_title : l10n.floor_new_shift_title,
                    style: AppTextStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    controller: _staffNameCtrl,
                    label: l10n.floor_staff_name_label,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l10n.floor_required_field : null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _PickerField(
                    label: l10n.floor_date_label,
                    icon: Icons.calendar_today_outlined,
                    listenable: _date,
                    formatter: (v) => v == null ? null : _formatDate(v),
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: _PickerField(
                          label: l10n.floor_start_time_label,
                          icon: Icons.access_time,
                          listenable: _startTime,
                          formatter: (v) =>
                              v == null ? null : _formatTime(v),
                          onTap: () => _pickTime(_startTime),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _PickerField(
                          label: l10n.floor_end_time_label,
                          icon: Icons.access_time,
                          listenable: _endTime,
                          formatter: (v) =>
                              v == null ? null : _formatTime(v),
                          onTap: () => _pickTime(_endTime),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _notesCtrl,
                    label: l10n.floor_notes_label,
                    maxLines: 3,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _TablesSelector(
                    selectedIds: _selectedTableIds,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  ValueListenableBuilder<bool>(
                    valueListenable: _submitting,
                    builder: (_, submitting, __) => PrimaryButton(
                      label: l10n.saveBtn,
                      isLoading: submitting,
                      onPressed: submitting ? null : _submit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TablesSelector extends ConsumerWidget {
  const _TablesSelector({required this.selectedIds});

  final ValueNotifier<List<String>> selectedIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final floorAsync = ref.watch(floorControllerProvider);
    final tables = floorAsync.valueOrNull;

    if (floorAsync.isLoading && tables == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Text(
          l10n.floor_tables_loading,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
        ),
      );
    }

    if (tables == null || tables.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Text(
          l10n.floor_no_tables_available,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.floor_tables_optional,
          style: AppTextStyles.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedIds,
          builder: (_, selected, __) => Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: [
              for (final table in tables)
                FilterChip(
                  label: Text(l10n.floor_table_number(table.displayNumber)),
                  selected: selected.contains(table.id),
                  onSelected: (val) {
                    final next = [...selected];
                    if (val) {
                      next.add(table.id);
                    } else {
                      next.remove(table.id);
                    }
                    selectedIds.value = next;
                  },
                  selectedColor: AppColors.primary.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.primary,
                ),
            ],
          ),
        ),
      ],
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

class _PickerField<T> extends StatelessWidget {
  const _PickerField({
    required this.label,
    required this.icon,
    required this.listenable,
    required this.formatter,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final ValueListenable<T?> listenable;
  final String? Function(T?) formatter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
      valueListenable: listenable,
      builder: (context, value, _) {
        final formatted = formatter(value);
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon),
            ),
            child: Text(
              formatted ?? '—',
              style: AppTextStyles.bodyLarge.copyWith(
                color: formatted == null
                    ? AppColors.textHint
                    : AppColors.textPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
