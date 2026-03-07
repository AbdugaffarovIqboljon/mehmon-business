import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

Future<TimeOfDay?> showRestaurantTimePickerSheet({
  required BuildContext context,
  required TimeOfDay initialTime,
  required String title,
}) {
  return showModalBottomSheet<TimeOfDay>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return RestaurantTimePickerSheet(
        title: title,
        initialTime: initialTime,
      );
    },
  );
}

class RestaurantTimePickerSheet extends StatefulWidget {
  const RestaurantTimePickerSheet({
    required this.title,
    required this.initialTime,
    super.key,
  });

  final String title;
  final TimeOfDay initialTime;

  @override
  State<RestaurantTimePickerSheet> createState() =>
      RestaurantTimePickerSheetState();
}

class RestaurantTimePickerSheetState extends State<RestaurantTimePickerSheet> {
  late int selectedHour;
  late int selectedMinute;
  late final FixedExtentScrollController hourController;
  late final FixedExtentScrollController minuteController;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.initialTime.hour;
    selectedMinute = widget.initialTime.minute;
    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
  }

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  String formatTwoDigits(int value) => value.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXl),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimePreviewBox(value: formatTwoDigits(selectedHour)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  child: Text(':', style: AppTextStyles.headlineLarge),
                ),
                TimePreviewBox(value: formatTwoDigits(selectedMinute)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 220,
              child: Row(
                children: [
                  Expanded(
                    child: TimeWheelPicker(
                      controller: hourController,
                      itemCount: 24,
                      onSelectedItemChanged: (index) =>
                          setState(() => selectedHour = index),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: TimeWheelPicker(
                      controller: minuteController,
                      itemCount: 60,
                      onSelectedItemChanged: (index) =>
                          setState(() => selectedMinute = index),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Отмена'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(
                      TimeOfDay(hour: selectedHour, minute: selectedMinute),
                    ),
                    child: const Text('ОК'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeWheelPicker extends StatelessWidget {
  const TimeWheelPicker({
    required this.controller,
    required this.itemCount,
    required this.onSelectedItemChanged,
    super.key,
  });

  final FixedExtentScrollController controller;
  final int itemCount;
  final ValueChanged<int> onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: CupertinoPicker(
        scrollController: controller,
        itemExtent: 42,
        magnification: 1.1,
        useMagnifier: true,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: AppColors.primary.withAlpha(56),
              ),
            ),
          ),
        ),
        onSelectedItemChanged: onSelectedItemChanged,
        children: List.generate(
          itemCount,
          (index) => Center(
            child: Text(
              index.toString().padLeft(2, '0'),
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimePreviewBox extends StatelessWidget {
  const TimePreviewBox({
    required this.value,
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 92),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(36),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: AppTextStyles.headlineMedium.copyWith(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
