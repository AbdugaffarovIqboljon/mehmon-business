import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';

class AddShiftSheet extends ConsumerStatefulWidget {
  const AddShiftSheet({super.key});

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
  late final ValueNotifier<bool> _submitting;

  @override
  void initState() {
    super.initState();
    _staffNameCtrl = TextEditingController();
    _notesCtrl = TextEditingController();
    _date = ValueNotifier(null);
    _startTime = ValueNotifier(null);
    _endTime = ValueNotifier(null);
    _submitting = ValueNotifier(false);
  }

  @override
  void dispose() {
    _staffNameCtrl.dispose();
    _notesCtrl.dispose();
    _date.dispose();
    _startTime.dispose();
    _endTime.dispose();
    _submitting.dispose();
    super.dispose();
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
    final date = _date.value;
    final start = _startTime.value;
    final end = _endTime.value;
    if (date == null || start == null || end == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sana va vaqtni tanlang')),
      );
      return;
    }

    _submitting.value = true;
    final notes = _notesCtrl.text.trim();
    final ok = await ref.read(shiftsControllerProvider.notifier).addShift(
          staffName: _staffNameCtrl.text.trim(),
          startTime: _formatTime(start),
          endTime: _formatTime(end),
          date: _formatDate(date),
          notes: notes.isEmpty ? null : notes,
        );
    if (!mounted) return;
    _submitting.value = false;
    if (ok) {
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
                const Text(
                  "Yangi smena qo'shish",
                  style: AppTextStyles.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextField(
                  controller: _staffNameCtrl,
                  label: 'Xodim ismi',
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Majburiy' : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                _PickerField(
                  label: 'Sana',
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
                        label: 'Boshlanish',
                        icon: Icons.access_time,
                        listenable: _startTime,
                        formatter: (v) => v == null ? null : _formatTime(v),
                        onTap: () => _pickTime(_startTime),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _PickerField(
                        label: 'Tugash',
                        icon: Icons.access_time,
                        listenable: _endTime,
                        formatter: (v) => v == null ? null : _formatTime(v),
                        onTap: () => _pickTime(_endTime),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _notesCtrl,
                  label: 'Izoh (ixtiyoriy)',
                  maxLines: 3,
                ),
                const SizedBox(height: AppSpacing.xl),
                ValueListenableBuilder<bool>(
                  valueListenable: _submitting,
                  builder: (_, submitting, __) => PrimaryButton(
                    label: 'Saqlash',
                    isLoading: submitting,
                    onPressed: submitting ? null : _submit,
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
