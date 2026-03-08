import 'package:flutter/material.dart';
import 'package:mehmon/l10n/app_localizations.dart';

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
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.88, end: 1).animate(animation),
              child: child,
            ),
          ),
          child: isExpanded
              ? const _CollapseChip(key: ValueKey('collapse'))
              : const _ExpandChip(key: ValueKey('expand')),
        ),
      ),
    );
  }
}

// ── Collapsed state chip ────────────────────────────────────────────────────

class _ExpandChip extends StatelessWidget {
  const _ExpandChip({super.key});

  @override
  Widget build(BuildContext context) {
    return _HandleChip(
      leadingIcon: Icons.calendar_month_rounded,
      label: AppLocalizations.of(context)!.viewCalendar,
      trailingIcon: Icons.keyboard_arrow_up_rounded,
    );
  }
}

// ── Expanded state chip ─────────────────────────────────────────────────────

class _CollapseChip extends StatelessWidget {
  const _CollapseChip({super.key});

  @override
  Widget build(BuildContext context) {
    return _HandleChip(
      leadingIcon: Icons.keyboard_arrow_down_rounded,
      label: AppLocalizations.of(context)!.collapse,
      trailingIcon: null,
    );
  }
}

// ── Shared chip UI ──────────────────────────────────────────────────────────

class _HandleChip extends StatelessWidget {
  const _HandleChip({
    required this.leadingIcon,
    required this.label,
    required this.trailingIcon,
  });

  final IconData leadingIcon;
  final String label;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF8E99AB);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF0F4),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(leadingIcon, size: 15, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: color,
              height: 1,
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 3),
            Icon(trailingIcon, size: 15, color: color),
          ],
        ],
      ),
    );
  }
}
