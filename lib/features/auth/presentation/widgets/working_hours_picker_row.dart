import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/features/auth/presentation/widgets/auth_selection_field.dart';
import 'package:mehmon/features/auth/presentation/widgets/restaurant_time_picker_sheet.dart';

class WorkingHoursPickerRow extends StatelessWidget {
  const WorkingHoursPickerRow({
    required this.openingHintText,
    required this.closingHintText,
    required this.onOpeningTimeChanged,
    required this.onClosingTimeChanged,
    super.key,
    this.openingTime,
    this.closingTime,
  });

  final TimeOfDay? openingTime;
  final TimeOfDay? closingTime;
  final String openingHintText;
  final String closingHintText;
  final ValueChanged<TimeOfDay> onOpeningTimeChanged;
  final ValueChanged<TimeOfDay> onClosingTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RestaurantTimePickerField(
            selectedTime: openingTime,
            hintText: openingHintText,
            onChanged: onOpeningTimeChanged,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: RestaurantTimePickerField(
            selectedTime: closingTime,
            hintText: closingHintText,
            onChanged: onClosingTimeChanged,
          ),
        ),
      ],
    );
  }
}

class RestaurantTimePickerField extends StatelessWidget {
  const RestaurantTimePickerField({
    required this.hintText,
    required this.onChanged,
    super.key,
    this.selectedTime,
  });

  final String hintText;
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onChanged;

  Future<void> openTimePicker(BuildContext context) async {
    final pickedTime = await showRestaurantTimePickerSheet(
      context: context,
      initialTime: selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
      title: hintText,
    );

    if (pickedTime != null) {
      onChanged(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = selectedTime == null
        ? hintText
        : MaterialLocalizations.of(
            context,
          ).formatTimeOfDay(selectedTime!, alwaysUse24HourFormat: true);

    return AuthSelectionField(
      text: formattedTime,
      isPlaceholder: selectedTime == null,
      trailingIcon: Icons.keyboard_arrow_down,
      onTap: () => openTimePicker(context),
    );
  }
}
