import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';

class BookingCalendarHandle extends StatelessWidget {
  const BookingCalendarHandle({
    required this.isExpanded,
    required this.onTap,
    super.key,
  });

  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final semanticLabel =
        isExpanded ? 'Свернуть календарь' : 'Развернуть календарь';

    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Center(
            child: SizedBox(
              height: 12,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                alignment:
                    isExpanded ? Alignment.topCenter : Alignment.bottomCenter,
                child: AnimatedContainer(
                  key: const ValueKey('booking-calendar-handle-pill'),
                  duration: const Duration(milliseconds: 180),
                  width: isExpanded ? 50 : 44,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8DDE5),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
