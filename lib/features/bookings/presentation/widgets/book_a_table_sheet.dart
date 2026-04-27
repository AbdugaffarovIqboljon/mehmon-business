import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/formatters/uzbek_phone_input_formatter.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/features/bookings/presentation/controllers/book_a_table_date_controller.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_selector.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_form_actions.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_time_selector.dart';
import 'package:mehmon/features/bookings/presentation/widgets/guest_count_picker.dart';
import 'package:mehmon/l10n/app_localizations.dart';

const List<String> defaultBookingTimes = [
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
];

Future<BookATableFormPayload?> showBookATableSheet(
  BuildContext context, {
  DateTime? initialDate,
  List<String> timeSlots = defaultBookingTimes,
}) {
  final normalizedInitialDate = DateUtils.dateOnly(
    initialDate ?? DateTime.now(),
  );

  return showModalBottomSheet<BookATableFormPayload>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    barrierColor: Colors.black.withValues(alpha: 0.42),
    backgroundColor: AppColors.card,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (context) {
      final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
      return AnimatedPadding(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.only(bottom: bottomInset),
        child: FractionallySizedBox(
          heightFactor: 0.93,
          child: ProviderScope(
            overrides: [
              bookATableInitialDateProvider.overrideWithValue(
                normalizedInitialDate,
              ),
            ],
            child: BookATableSheet(timeSlots: timeSlots),
          ),
        ),
      );
    },
  );
}

class BookATableFormPayload {
  const BookATableFormPayload({
    required this.guestCount,
    required this.selectedTime,
    required this.selectedDate,
    required this.guestName,
    required this.phoneNumber,
  });

  final int guestCount;
  final String selectedTime;
  final DateTime selectedDate;
  final String guestName;
  final String phoneNumber;

  DateTime get bookingDateTime {
    final date = DateUtils.dateOnly(selectedDate);
    final parts = selectedTime.split(':');
    final hour = int.tryParse(parts.first) ?? 0;
    final minute = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  String get phoneNumberE164 => UzbekPhoneInput.toE164(phoneNumber);
}

class BookATableSheet extends ConsumerStatefulWidget {
  const BookATableSheet({required this.timeSlots, super.key});

  final List<String> timeSlots;

  @override
  ConsumerState<BookATableSheet> createState() => _BookATableSheetState();
}

class _BookATableSheetState extends ConsumerState<BookATableSheet> {
  static const int _minGuests = 1;
  static const int _initialGuests = 3;

  final _guestNameController = TextEditingController();
  final _phoneController = TextEditingController();
  String _lastPhoneValue = UzbekPhoneInput.countryCode;

  static const List<String> _bookingTypes = ['Standard', 'Banket'];

  late int _guestCount;
  late String _selectedTime;
  String? _selectedEndTime;
  String _selectedBookingType = 'Standard';

  @override
  void initState() {
    super.initState();
    _guestCount = _initialGuests;
    _selectedTime = widget.timeSlots.contains('18:00')
        ? '18:00'
        : widget.timeSlots.first;
    UzbekPhoneInput.seedController(_phoneController);
    _lastPhoneValue = _phoneController.text;
  }

  @override
  void dispose() {
    _guestNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneChanged(String value) {
    if (UzbekPhoneInput.justCompleted(
      previousValue: _lastPhoneValue,
      currentValue: value,
    )) {
      FocusScope.of(context).unfocus();
    }
    _lastPhoneValue = value;
  }

  void _decreaseGuests() {
    if (_guestCount <= _minGuests) return;
    setState(() => _guestCount--);
  }

  void _increaseGuests() {
    setState(() => _guestCount++);
  }

  Future<void> _confirm() async {
    final guestName = _guestNameController.text.trim();
    final phone = _phoneController.text.trim();

    if (guestName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mehmon ismini kiriting')),
      );
      return;
    }
    if (!UzbekPhoneInput.isValid(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Telefon raqamini kiriting')),
      );
      return;
    }

    final dateState = ref.read(bookATableDateControllerProvider);
    final dateStr = DateFormat('yyyy-MM-dd').format(dateState.selectedDate);
    // TODO: wire table selection UI when available — backend will reject empty tableId
    const tableId = '';

    final success = await ref
        .read(bookingControllerProvider.notifier)
        .createBooking(
          guestName: guestName,
          phone: UzbekPhoneInput.toE164(phone),
          tableId: tableId,
          date: dateStr,
          timeSlot: _selectedTime,
          numberOfGuests: _guestCount,
          endTime: _selectedEndTime,
          bookingType: _selectedBookingType,
        );

    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bron qo'shildi")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Xatolik yuz berdi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final dateState = ref.watch(bookATableDateControllerProvider);
    final dateController = ref.read(bookATableDateControllerProvider.notifier);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          AppSpacing.lg,
          AppSpacing.xl,
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                      splashRadius: 22,
                    ),
                  ),
                  Center(
                    child: Text(
                      loc.bookATable,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loc.guestsLabel,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GuestCountPicker(
                          guestCount: _guestCount,
                          onIncrement: _increaseGuests,
                          onDecrement: _decreaseGuests,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(
                      loc.selectTime,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    BookingTimeSelector(
                      times: widget.timeSlots,
                      selectedTime: _selectedTime,
                      onTimeSelected: (time) {
                        setState(() => _selectedTime = time);
                      },
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(
                      'Tugash vaqti',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _EndTimeSelector(
                      times: widget.timeSlots,
                      selectedTime: _selectedEndTime,
                      onTimeSelected: (String time) {
                        setState(() => _selectedEndTime =
                            _selectedEndTime == time ? null : time);
                      },
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(
                      'Bron turi',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _BookingTypeSelector(
                      types: _bookingTypes,
                      selectedType: _selectedBookingType,
                      onTypeSelected: (String type) {
                        setState(() => _selectedBookingType = type);
                      },
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    BookingDateSelector(
                      selectedMonth: dateState.selectedMonth,
                      selectedDate: dateState.selectedDate,
                      visibleDates: dateState.visibleDates,
                      onMonthSelected: dateController.selectMonth,
                      onDateSelected: dateController.selectDate,
                      onRevealPreviousDates: dateController.revealPreviousDates,
                      onRevealNextDates: dateController.revealNextDates,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      loc.guestNameLabel,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _guestNameController,
                      hint: loc.nameHint,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      loc.phoneLabel,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: UzbekPhoneInput.inputFormatters,
                      onChanged: _onPhoneChanged,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            BookingFormActions(
              onCancel: () => Navigator.of(context).pop(),
              onConfirm: _confirm,
            ),
          ],
        ),
      ),
    );
  }
}

class _EndTimeSelector extends StatelessWidget {
  const _EndTimeSelector({
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final List<String> times;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = AppSpacing.md;
        final itemWidth =
            ((constraints.maxWidth - (spacing * 3)) / 4).clamp(72.0, 120.0);
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: times.map((time) {
            final isSelected = time == selectedTime;
            return SizedBox(
              width: itemWidth,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  onTap: () => onTimeSelected(time),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : AppColors.surface,
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radiusMd),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.md,
                      ),
                      child: Text(
                        time,
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge?.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.primaryDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _BookingTypeSelector extends StatelessWidget {
  const _BookingTypeSelector({
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final List<String> types;
  final String selectedType;
  final ValueChanged<String> onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: types.map((type) {
        final isSelected = type == selectedType;
        return Padding(
          padding: const EdgeInsets.only(right: AppSpacing.md),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              onTap: () => onTypeSelected(type),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  child: Text(
                    type,
                    style: textTheme.titleLarge?.copyWith(
                      color:
                          isSelected ? Colors.white : AppColors.primaryDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
