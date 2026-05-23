import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class BookingTimeSelector extends StatefulWidget {
  const BookingTimeSelector({
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
    super.key,
    this.allowDeselect = false,
  });

  final List<String> times;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;
  final bool allowDeselect;

  @override
  State<BookingTimeSelector> createState() => _BookingTimeSelectorState();
}

class _BookingTimeSelectorState extends State<BookingTimeSelector> {
  late final ScrollController _scrollController;
  static const double _chipWidth = 80;
  static const double _chipHeight = 44;
  static const double _spacing = 8;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  @override
  void didUpdateWidget(BookingTimeSelector old) {
    super.didUpdateWidget(old);
    if (old.selectedTime != widget.selectedTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _scrollToSelected() {
    if (!_scrollController.hasClients) return;
    final idx = widget.times.indexOf(widget.selectedTime ?? '');
    if (idx < 0) return;
    final offset = idx * (_chipWidth + _spacing);
    _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _chipHeight,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: widget.times.length,
        separatorBuilder: (_, __) => const SizedBox(width: _spacing),
        itemBuilder: (context, i) {
          final time = widget.times[i];
          final isSelected = time == widget.selectedTime;
          return _TimeChip(
            time: time,
            isSelected: isSelected,
            onTap: () {
              if (widget.allowDeselect && isSelected) {
                widget.onTimeSelected(time);
              } else if (!isSelected) {
                widget.onTimeSelected(time);
              }
            },
          );
        },
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  const _TimeChip({
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: _BookingTimeSelectorState._chipWidth,
        height: _BookingTimeSelectorState._chipHeight,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.4),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
