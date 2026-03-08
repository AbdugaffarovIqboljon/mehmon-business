import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_card.dart';

class BookingDateStrip extends StatefulWidget {
  const BookingDateStrip({
    required this.dates,
    required this.selectedDate,
    required this.onDateTap,
    required this.onExpandRequested,
    super.key,
  });

  final List<DateTime> dates;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateTap;
  final VoidCallback onExpandRequested;

  @override
  State<BookingDateStrip> createState() => _BookingDateStripState();
}

class _BookingDateStripState extends State<BookingDateStrip> {
  static const _cardWidth = 102.0;
  static const _cardGap = AppSpacing.md;
  static const _pageSize = 7;
  static const _edgeThreshold = 140.0;

  late final ScrollController _scrollController;
  bool _didCenterInitially = false;
  bool _isPrepending = false;
  late List<DateTime> _visibleDates;

  @override
  void initState() {
    super.initState();
    _visibleDates = List<DateTime>.of(widget.dates);
    _scrollController = ScrollController(keepScrollOffset: false);
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _centerSelectedDate());
  }

  @override
  void didUpdateWidget(covariant BookingDateStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selectedChanged = !DateUtils.isSameDay(
      oldWidget.selectedDate,
      widget.selectedDate,
    );
    final datesChanged = oldWidget.dates != widget.dates;
    if (selectedChanged || datesChanged) {
      final containsSelected = _visibleDates.any(
        (date) => DateUtils.isSameDay(date, widget.selectedDate),
      );
      if (!containsSelected || _visibleDates.isEmpty) {
        _visibleDates = List<DateTime>.of(widget.dates);
        _didCenterInitially = false;
      }
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _centerSelectedDate(),
      );
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients ||
        _visibleDates.isEmpty ||
        _isPrepending) {
      return;
    }

    final position = _scrollController.position;
    final currentOffset = _scrollController.offset;

    if (currentOffset >= position.maxScrollExtent - _edgeThreshold) {
      _appendNextDates();
    }

    if (currentOffset <= position.minScrollExtent + _edgeThreshold) {
      _prependPreviousDates();
    }
  }

  void _appendNextDates() {
    final lastDate = _visibleDates.last;
    final nextDates = List<DateTime>.generate(
      _pageSize,
      (index) => DateUtils.dateOnly(lastDate.add(Duration(days: index + 1))),
    );
    setState(() {
      _visibleDates.addAll(nextDates);
    });
  }

  void _prependPreviousDates() {
    final firstDate = _visibleDates.first;
    final previousDates = List<DateTime>.generate(
      _pageSize,
      (index) => DateUtils.dateOnly(
        firstDate.subtract(Duration(days: _pageSize - index)),
      ),
    );
    final shift = previousDates.length * (_cardWidth + _cardGap);
    setState(() {
      _isPrepending = true;
      _visibleDates.insertAll(0, previousDates);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      _scrollController.jumpTo(_scrollController.offset + shift);
      _isPrepending = false;
    });
  }

  void _centerSelectedDate() {
    if (!mounted || !_scrollController.hasClients || _visibleDates.isEmpty) {
      return;
    }
    final selectedIndex = _visibleDates.indexWhere(
      (date) => DateUtils.isSameDay(date, widget.selectedDate),
    );
    if (selectedIndex < 0) {
      _visibleDates = List<DateTime>.of(widget.dates);
      _didCenterInitially = false;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _centerSelectedDate(),
      );
      return;
    }

    final targetOffset = selectedIndex * (_cardWidth + _cardGap);
    final clampedTargetOffset = targetOffset.clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );

    if (_didCenterInitially) {
      _scrollController.animateTo(
        clampedTargetOffset,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
    } else {
      _scrollController.jumpTo(clampedTargetOffset);
      _didCenterInitially = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final sidePadding = math
              .max(0, (constraints.maxWidth - _cardWidth) / 2)
              .toDouble();

          return ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            itemCount: _visibleDates.length,
            separatorBuilder: (_, __) => const SizedBox(width: _cardGap),
            itemBuilder: (context, index) {
              final date = _visibleDates[index];
              final isSelected = DateUtils.isSameDay(date, widget.selectedDate);
              return BookingDateCard(
                date: date,
                isSelected: isSelected,
                onTap: () => widget.onDateTap(date),
                onLongPress: widget.onExpandRequested,
              );
            },
          );
        },
      ),
    );
  }
}
