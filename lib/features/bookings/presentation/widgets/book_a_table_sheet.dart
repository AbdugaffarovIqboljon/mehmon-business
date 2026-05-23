import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/formatters/uzbek_phone_input_formatter.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/services/booking_conflict_resolver.dart';
import 'package:mehmon/features/bookings/presentation/controllers/book_a_table_date_controller.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_selector.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_form_actions.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_time_selector.dart';
import 'package:mehmon/features/bookings/presentation/widgets/guest_count_picker.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

extension BookingTypeApi on BookingType {
  String get apiValue => switch (this) {
    BookingType.standard => 'Standard',
    BookingType.banket => 'Banket',
  };
}

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
  BookingEntity? existingBooking,
}) {
  final normalizedInitialDate = DateUtils.dateOnly(
    initialDate ??
        (existingBooking != null
            ? DateTime.tryParse(existingBooking.date) ?? DateTime.now()
            : DateTime.now()),
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
            child: BookATableSheet(
              timeSlots: timeSlots,
              existingBooking: existingBooking,
            ),
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
  const BookATableSheet({
    required this.timeSlots,
    super.key,
    this.existingBooking,
  });

  final List<String> timeSlots;
  final BookingEntity? existingBooking;

  @override
  ConsumerState<BookATableSheet> createState() => _BookATableSheetState();

  static List<String> buildTimeSlots({
    String? opening,
    String? closing,
    List<String> fallback = defaultBookingTimes,
  }) {
    if (opening == null || closing == null) return fallback;
    final start = _parseHHMM(opening);
    final end = _parseHHMM(closing);
    if (start == null || end == null) return fallback;

    final slots = <String>[];
    var current = start;
    while (current < end) {
      slots.add(_formatHHMM(current));
      current += 30;
    }
    return slots.isEmpty ? fallback : slots;
  }

  static int? _parseHHMM(String hhmm) {
    final parts = hhmm.split(':');
    if (parts.length != 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return null;
    return h * 60 + m;
  }

  static String _formatHHMM(int minutes) {
    final h = (minutes ~/ 60).toString().padLeft(2, '0');
    final m = (minutes % 60).toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _BookATableSheetState extends ConsumerState<BookATableSheet> {
  static const int _minGuests = 1;
  static const int _initialGuests = 3;

  final _guestNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  String _lastPhoneValue = UzbekPhoneInput.countryCode;

  static const List<BookingType> _bookingTypes = BookingType.values;

  late final ValueNotifier<int> _guestCount;
  late final ValueNotifier<String> _selectedTime;
  late final ValueNotifier<String?> _selectedEndTime;
  late final ValueNotifier<BookingType> _selectedBookingType;
  late final ValueNotifier<FloorEntity?> _selectedTable;
  final ValueNotifier<Set<String>> _busyIds = ValueNotifier(const {});
  final ValueNotifier<String?> _tableConflictMsg = ValueNotifier(null);
  bool _tablePreFilled = false;

  @override
  void initState() {
    super.initState();
    final initialSlots = _resolveSlots();
    final existing = widget.existingBooking;
    if (existing == null) {
      _guestCount = ValueNotifier<int>(_initialGuests);
      _selectedTime = ValueNotifier<String>(
        initialSlots.contains('18:00') ? '18:00' : initialSlots.first,
      );
      _selectedEndTime = ValueNotifier<String?>(null);
      _selectedBookingType = ValueNotifier<BookingType>(BookingType.standard);
      _selectedTable = ValueNotifier<FloorEntity?>(null);
      UzbekPhoneInput.seedController(_phoneController);
    } else {
      _guestNameController.text = existing.guestName;
      final localDigits = UzbekPhoneInput.extractLocalDigits(existing.phone);
      _phoneController.text = UzbekPhoneInput.formatLocalDigits(localDigits);
      _selectedBookingType = ValueNotifier<BookingType>(
        existing.bookingType ?? BookingType.standard,
      );
      _guestCount = ValueNotifier<int>(existing.numberOfGuests);
      _selectedTime = ValueNotifier<String>(
        initialSlots.contains(existing.timeSlot)
            ? existing.timeSlot
            : (initialSlots.isNotEmpty ? initialSlots.first : '18:00'),
      );
      _selectedEndTime = ValueNotifier<String?>(existing.endTime);
      _selectedTable = ValueNotifier<FloorEntity?>(null);
      _notesController.text = existing.notes ?? '';
      if (existing.tableInfo != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _tryPreFillTable());
      }
    }
    _lastPhoneValue = _phoneController.text;
    _recomputeBusy();
    _selectedTime..addListener(_recomputeBusy)
    ..addListener(_onStartTimeChanged);
    _selectedEndTime.addListener(_recomputeBusy);
    _selectedBookingType.addListener(_recomputeBusy);
    _selectedTable.addListener(() {
      if (_selectedTable.value != null) {
        _tableConflictMsg.value = null;
      }
    });
  }

  List<String> _resolveSlots() {
    final profile = ref.read(profileControllerProvider).valueOrNull;
    return BookATableSheet.buildTimeSlots(
      opening: profile?.openingTime,
      closing: profile?.closingTime,
      fallback: widget.timeSlots,
    );
  }

  void _tryPreFillTable() {
    if (!mounted || _tablePreFilled) return;
    final tableId = widget.existingBooking?.tableInfo?.id;
    if (tableId == null) return;
    final floors = ref.read(floorControllerProvider).valueOrNull ?? [];
    for (final floor in floors) {
      if (floor.id == tableId) {
        _selectedTable.value = floor;
        _tablePreFilled = true;
        return;
      }
    }
  }

  void _onStartTimeChanged() {
    final end = _selectedEndTime.value;
    if (end != null && end.compareTo(_selectedTime.value) <= 0) {
      _selectedEndTime.value = null;
    }
  }

  @override
  void dispose() {
    _guestNameController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    _selectedTime..removeListener(_onStartTimeChanged)
    ..removeListener(_recomputeBusy);
    _selectedEndTime.removeListener(_recomputeBusy);
    _selectedBookingType.removeListener(_recomputeBusy);
    _guestCount.dispose();
    _selectedTime.dispose();
    _selectedEndTime.dispose();
    _selectedBookingType.dispose();
    _selectedTable.dispose();
    _busyIds.dispose();
    _tableConflictMsg.dispose();
    super.dispose();
  }

  void _recomputeBusy() {
    final bookings = ref.read(bookingControllerProvider).valueOrNull ?? [];
    final dateState = ref.read(bookATableDateControllerProvider);
    final date = DateFormat('yyyy-MM-dd').format(dateState.selectedDate);

    final startMin = hhmmToMin(_selectedTime.value);
    if (startMin == null) {
      _busyIds.value = const {};
      _tableConflictMsg.value = null;
      return;
    }

    final int endMin;
    if (_selectedBookingType.value == BookingType.banket &&
        _selectedEndTime.value != null) {
      final parsed = hhmmToMin(_selectedEndTime.value!);
      endMin = parsed ?? (startMin + kAssumedStandardDurationMin);
    } else {
      endMin = startMin + kAssumedStandardDurationMin;
    }

    _busyIds.value = busyTableIds(
      bookings: bookings,
      date: date,
      startMin: startMin,
      endMin: endMin,
      excludeBookingId: widget.existingBooking?.id,
    );

    final selected = _selectedTable.value;
    if (selected != null && _busyIds.value.contains(selected.id)) {
      final window = conflictWindowFor(
        bookings: bookings,
        tableId: selected.id,
        date: date,
        startMin: startMin,
        endMin: endMin,
        excludeBookingId: widget.existingBooking?.id,
      );
      _tableConflictMsg.value = window != null
          ? "Bu stol $window vaqt oralig'ida band"
          : 'Bu stol band';
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) _selectedTable.value = null;
      });
    } else {
      _tableConflictMsg.value = null;
    }
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
    if (_guestCount.value <= _minGuests) return;
    _guestCount.value--;
  }

  void _increaseGuests() {
    _guestCount.value++;
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
    final selectedTable = _selectedTable.value;
    if (selectedTable == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Stol tanlang')),
      );
      return;
    }
    final bookingType = _selectedBookingType.value;
    final endTimeValue = _selectedEndTime.value;
    if (bookingType == BookingType.banket && endTimeValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Banket uchun tugash vaqtini tanlang'),
        ),
      );
      return;
    }

    final dateState = ref.read(bookATableDateControllerProvider);
    final dateStr = DateFormat('yyyy-MM-dd').format(dateState.selectedDate);
    final endTime = endTimeValue;
    final notes = _notesController.text.trim().isEmpty
        ? null
        : _notesController.text.trim();
    final existing = widget.existingBooking;

    // Race-condition guard: re-check with the freshest booking snapshot
    // just before committing, in case another booking was created after
    // the form was opened.
    final freshBookings =
        ref.read(bookingControllerProvider).valueOrNull ?? [];
    final startMin = hhmmToMin(_selectedTime.value) ?? 0;
    final int freshEndMin;
    if (_selectedBookingType.value == BookingType.banket &&
        _selectedEndTime.value != null) {
      freshEndMin = hhmmToMin(_selectedEndTime.value!) ??
          (startMin + kAssumedStandardDurationMin);
    } else {
      freshEndMin = startMin + kAssumedStandardDurationMin;
    }
    final conflictWindow = conflictWindowFor(
      bookings: freshBookings,
      tableId: selectedTable.id,
      date: dateStr,
      startMin: startMin,
      endMin: freshEndMin,
      excludeBookingId: existing?.id,
    );
    if (conflictWindow != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${selectedTable.number} stoli $conflictWindow '
            "vaqt oralig'ida allaqachon band",
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final bool success;
    if (existing != null) {
      success = await ref
          .read(bookingControllerProvider.notifier)
          .updateBooking(
            id: existing.id,
            guestName: guestName,
            phone: UzbekPhoneInput.toE164(phone),
            tableId: selectedTable.id,
            date: dateStr,
            timeSlot: _selectedTime.value,
            numberOfGuests: _guestCount.value,
            status: existing.status,
            endTime: endTime,
            bookingType: bookingType.apiValue,
            notes: notes,
          );
    } else {
      success = await ref
          .read(bookingControllerProvider.notifier)
          .createBooking(
            guestName: guestName,
            phone: UzbekPhoneInput.toE164(phone),
            tableId: selectedTable.id,
            date: dateStr,
            timeSlot: _selectedTime.value,
            numberOfGuests: _guestCount.value,
            endTime: endTime,
            bookingType: bookingType.apiValue,
            notes: notes,
          );
    }

    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            existing != null ? 'Bron yangilandi' : "Bron qo'shildi",
          ),
        ),
      );
    } else {
      final conflictWindow = ref
          .read(bookingControllerProvider.notifier)
          .lastConflictWindow;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            conflictWindow != null
                ? "Bu vaqt oralig'ida ($conflictWindow) stol allaqachon band"
                : 'Xatolik yuz berdi',
          ),
          backgroundColor:
              conflictWindow != null ? AppColors.error : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final headlineBold = textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final dateState = ref.watch(bookATableDateControllerProvider);
    final dateController = ref.read(bookATableDateControllerProvider.notifier);
    final isEditMode = widget.existingBooking != null;

    final profile = ref.watch(profileControllerProvider).valueOrNull;
    final timeSlots = BookATableSheet.buildTimeSlots(
      opening: profile?.openingTime,
      closing: profile?.closingTime,
      fallback: widget.timeSlots,
    );

    ref
      ..listen(profileControllerProvider, (_, __) {
        final slots = _resolveSlots();
        if (!slots.contains(_selectedTime.value)) {
          _selectedTime.value =
              slots.contains('18:00') ? '18:00' : slots.first;
        }
        final end = _selectedEndTime.value;
        if (end != null && !slots.contains(end)) {
          _selectedEndTime.value = null;
        }
      })
      ..listen(floorControllerProvider, (_, __) => _tryPreFillTable())
      ..listen(bookATableDateControllerProvider, (_, __) => _recomputeBusy())
      ..listen<AsyncValue<List<BookingEntity>>>(
        bookingControllerProvider,
        (_, __) => _recomputeBusy(),
      );

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
                      isEditMode ? 'Bronni tahrirlash' : loc.bookATable,
                      style: headlineBold,
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
                        Text(loc.guestsLabel, style: headlineBold),
                        ValueListenableBuilder<int>(
                          valueListenable: _guestCount,
                          builder: (_, count, __) => GuestCountPicker(
                            guestCount: count,
                            onIncrement: _increaseGuests,
                            onDecrement: _decreaseGuests,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(loc.selectTime, style: headlineBold),
                    const SizedBox(height: AppSpacing.md),
                    ValueListenableBuilder<String>(
                      valueListenable: _selectedTime,
                      builder: (_, time, __) => BookingTimeSelector(
                        times: timeSlots,
                        selectedTime: time,
                        onTimeSelected: (selected) =>
                            _selectedTime.value = selected,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text('Bron turi', style: headlineBold),
                    const SizedBox(height: AppSpacing.md),
                    ValueListenableBuilder<BookingType>(
                      valueListenable: _selectedBookingType,
                      builder: (_, type, __) => _BookingTypeSelector(
                        types: _bookingTypes,
                        selectedType: type,
                        onTypeSelected: (BookingType selected) {
                          _selectedBookingType.value = selected;
                          if (selected != BookingType.banket) {
                            _selectedEndTime.value = null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    Text('Stol', style: headlineBold),
                    const SizedBox(height: AppSpacing.md),
                    ValueListenableBuilder<FloorEntity?>(
                      valueListenable: _selectedTable,
                      builder: (_, table, __) => _TableSelector(
                        selectedTable: table,
                        onTableSelected: (selected) =>
                            _selectedTable.value = selected,
                        busyIds: _busyIds,
                        selectedTime: _selectedTime,
                        selectedEndTime: _selectedEndTime,
                        selectedBookingType: _selectedBookingType,
                        excludeBookingId: widget.existingBooking?.id,
                      ),
                    ),
                    ValueListenableBuilder<String?>(
                      valueListenable: _tableConflictMsg,
                      builder: (_, msg, __) {
                        if (msg == null) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Text(
                            msg,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.error,
                            ),
                          ),
                        );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.xxl),
                        Text('Tugash vaqti', style: headlineBold),
                        const SizedBox(height: AppSpacing.md),
                        ValueListenableBuilder<String>(
                          valueListenable: _selectedTime,
                          builder: (_, startTime, __) {
                            final validEndTimes = timeSlots
                                .where((t) => t.compareTo(startTime) > 0)
                                .toList();
                            return ValueListenableBuilder<String?>(
                              valueListenable: _selectedEndTime,
                              builder: (_, end, __) => BookingTimeSelector(
                                times: validEndTimes,
                                selectedTime: end,
                                allowDeselect: true,
                                onTimeSelected: (String t) {
                                  _selectedEndTime.value =
                                      _selectedEndTime.value == t ? null : t;
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
                    Text(loc.guestNameLabel, style: headlineBold),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _guestNameController,
                      hint: loc.nameHint,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(loc.phoneLabel, style: headlineBold),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: UzbekPhoneInput.inputFormatters,
                      onChanged: _onPhoneChanged,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppTextField(
                      controller: _notesController,
                      label: 'Izoh',
                      hint: "Qo'shimcha ma'lumot (ixtiyoriy)",
                      maxLines: 2,
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
              confirmLabel: isEditMode ? 'Yangilash' : 'Saqlash',
            ),
          ],
        ),
      ),
    );
  }
}

class _TableSelector extends ConsumerWidget {
  // ValueNotifier fields prevent a const constructor.
  // ignore: prefer_const_constructors_in_immutables
  _TableSelector({
    required this.selectedTable,
    required this.onTableSelected,
    required this.busyIds,
    required this.selectedTime,
    required this.selectedEndTime,
    required this.selectedBookingType,
    this.excludeBookingId,
  });

  final FloorEntity? selectedTable;
  final ValueChanged<FloorEntity?> onTableSelected;
  final ValueNotifier<Set<String>> busyIds;
  final ValueNotifier<String> selectedTime;
  final ValueNotifier<String?> selectedEndTime;
  final ValueNotifier<BookingType> selectedBookingType;
  final String? excludeBookingId;

  InputDecoration _decoration() => InputDecoration(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      );

  Widget _disabledDropdown(String hintText) => IgnorePointer(
        child: DropdownButtonFormField<FloorEntity>(
          decoration: _decoration(),
          hint: Text(hintText),
          items: const [],
          onChanged: null,
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floorsAsync = ref.watch(floorControllerProvider);
    final bookings =
        ref.watch(bookingControllerProvider).valueOrNull ?? const <BookingEntity>[];
    final dateState = ref.watch(bookATableDateControllerProvider);
    final date = DateFormat('yyyy-MM-dd').format(dateState.selectedDate);

    final tables = floorsAsync.valueOrNull;
    final isFirstLoad = tables == null && floorsAsync.isLoading;
    final hasError = tables == null && floorsAsync.hasError;

    if (isFirstLoad) {
      return _disabledDropdown('Stollar yuklanmoqda...');
    }
    if (hasError) {
      return _disabledDropdown('Stollarni yuklashda xatolik');
    }

    final items = tables ?? const <FloorEntity>[];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: ValueListenableBuilder<Set<String>>(
          valueListenable: busyIds,
          builder: (context, busy, _) {
            final startMin = hhmmToMin(selectedTime.value);
            final int? endMin;
            if (startMin != null) {
              if (selectedBookingType.value == BookingType.banket &&
                  selectedEndTime.value != null) {
                endMin = hhmmToMin(selectedEndTime.value!) ??
                    (startMin + kAssumedStandardDurationMin);
              } else {
                endMin = startMin + kAssumedStandardDurationMin;
              }
            } else {
              endMin = null;
            }

            return DropdownButton<FloorEntity>(
              value: selectedTable,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              hint: const Text('Stol tanlang'),
              itemHeight: null,
              items: items.map((t) {
                final isBusy = busy.contains(t.id);
                final window = (isBusy && startMin != null && endMin != null)
                    ? conflictWindowFor(
                        bookings: bookings,
                        tableId: t.id,
                        date: date,
                        startMin: startMin,
                        endMin: endMin,
                        excludeBookingId: excludeBookingId,
                      )
                    : null;
                return DropdownMenuItem<FloorEntity>(
                  value: t,
                  enabled: !isBusy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${t.number} (${t.capacity} kishi)',
                        style: TextStyle(
                          color: isBusy
                              ? Theme.of(context).disabledColor
                              : null,
                        ),
                      ),
                      if (isBusy && window != null)
                        Text(
                          'Band: $window',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.error,
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onTableSelected,
            );
          },
        ),
      ),
    );
  }
}

class _BookingTypeSelector extends StatelessWidget {
  const _BookingTypeSelector({
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final List<BookingType> types;
  final BookingType selectedType;
  final ValueChanged<BookingType> onTypeSelected;

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
                    type.apiValue,
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
