import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_item.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_month_dropdown.dart';

class BookingDateSelector extends StatefulWidget {
  const BookingDateSelector({
    required this.selectedMonth,
    required this.selectedDate,
    required this.visibleDates,
    required this.onMonthSelected,
    required this.onDateSelected,
    required this.onRevealPreviousDates,
    required this.onRevealNextDates,
    super.key,
  });

  final DateTime selectedMonth;
  final DateTime selectedDate;
  final List<DateTime> visibleDates;
  final ValueChanged<DateTime> onMonthSelected;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onRevealPreviousDates;
  final VoidCallback onRevealNextDates;

  @override
  State<BookingDateSelector> createState() => _BookingDateSelectorState();
}

class _BookingDateSelectorState extends State<BookingDateSelector> {
  static const double _edgeThreshold = 72;
  static const double _itemWidth = 58;
  static const double _itemGap = AppSpacing.md;
  static const double _stripHeight = 84;

  late final ScrollController _scrollController;
  bool _isWaitingForStartReveal = false;
  bool _isWaitingForEndReveal = false;
  bool _didCenterInitially = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(keepScrollOffset: false);
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollSelectedDateIntoView(animate: false),
    );
  }

  @override
  void didUpdateWidget(covariant BookingDateSelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    final prepended = oldWidget.visibleDates.isNotEmpty &&
        widget.visibleDates.isNotEmpty &&
        widget.visibleDates.length > oldWidget.visibleDates.length &&
        widget.visibleDates.first.isBefore(oldWidget.visibleDates.first);

    if (prepended && _scrollController.hasClients) {
      final addedItems =
          widget.visibleDates.length - oldWidget.visibleDates.length;
      final shift = addedItems * (_itemWidth + _itemGap);
      final targetOffset = (_scrollController.offset + shift).clamp(
        _scrollController.position.minScrollExtent,
        _scrollController.position.maxScrollExtent,
      );
      _scrollController.jumpTo(targetOffset);
    }

    final selectedDateChanged = !DateUtils.isSameDay(
      oldWidget.selectedDate,
      widget.selectedDate,
    );
    final selectedMonthChanged = !_isSameMonth(
      oldWidget.selectedMonth,
      widget.selectedMonth,
    );

    if (selectedDateChanged || selectedMonthChanged) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollSelectedDateIntoView(animate: _didCenterInitially),
      );
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients || widget.visibleDates.isEmpty) {
      return;
    }

    final position = _scrollController.position;
    if (position.maxScrollExtent <= 0) {
      return;
    }

    if (position.pixels >= position.maxScrollExtent - _edgeThreshold) {
      if (!_isWaitingForEndReveal) {
        _isWaitingForEndReveal = true;
        widget.onRevealNextDates();
      }
    } else {
      _isWaitingForEndReveal = false;
    }

    if (position.pixels <= position.minScrollExtent + _edgeThreshold) {
      if (!_isWaitingForStartReveal) {
        _isWaitingForStartReveal = true;
        widget.onRevealPreviousDates();
      }
    } else {
      _isWaitingForStartReveal = false;
    }
  }

  void _scrollSelectedDateIntoView({required bool animate}) {
    if (!_scrollController.hasClients || widget.visibleDates.isEmpty) {
      return;
    }
    final selectedIndex = widget.visibleDates.indexWhere(
      (date) => DateUtils.isSameDay(date, widget.selectedDate),
    );
    if (selectedIndex < 0) {
      return;
    }

    final target = selectedIndex * (_itemWidth + _itemGap);
    final clampedTarget = target.clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );

    if (animate) {
      _scrollController.animateTo(
        clampedTarget,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
    } else {
      _scrollController.jumpTo(clampedTarget);
      _didCenterInitially = true;
    }
  }

  bool _isSameMonth(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            BookingMonthDropdown(
              selectedMonth: widget.selectedMonth,
              onMonthSelected: widget.onMonthSelected,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: _stripHeight,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.visibleDates.length,
            separatorBuilder: (_, __) => const SizedBox(width: _itemGap),
            itemBuilder: (context, index) {
              final date = widget.visibleDates[index];
              return BookingDateItem(
                date: date,
                isSelected: DateUtils.isSameDay(date, widget.selectedDate),
                onTap: () => widget.onDateSelected(date),
              );
            },
          ),
        ),
      ],
    );
  }
}
