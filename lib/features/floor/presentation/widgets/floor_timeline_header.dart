import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_time_ruler.dart';
import 'package:mehmon/l10n/app_localizations.dart';

/// Top header area of the Floor page containing the hamburger icon,
/// date text, centered time display, and interactive time ruler.
class FloorTimelineHeader extends ConsumerWidget {
  const FloorTimelineHeader({
    required this.minuteNotifier,
    required this.onTimeChanged,
    required this.onMenuTap,
    required this.onTimeTap,
    this.onLivePressed,
    super.key,
  });

  /// Current time in minutes since midnight, as a notifier so only the
  /// time-displaying widgets rebuild on minute-tick — not the whole header.
  final ValueNotifier<int> minuteNotifier;

  /// Fires when the ruler is dragged to a new time.
  final ValueChanged<int> onTimeChanged;

  /// Fires when the hamburger menu is tapped.
  final VoidCallback onMenuTap;

  /// Fires when the user taps the centered time text (snap-to-now).
  final VoidCallback onTimeTap;

  /// Fires after the Live chip resets the provider, so the caller can snap
  /// the ruler back to now.
  final VoidCallback? onLivePressed;

  static String _formatTime(int minute) {
    final h = (minute ~/ 60).toString().padLeft(2, '0');
    final m = (minute % 60).toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _formattedDate(BuildContext context) {
    final now = DateTime.now();
    final d = now.day.toString().padLeft(2, '0');
    final mo = now.month.toString().padLeft(2, '0');
    final y = now.year;
    final dateStr = '$d.$mo.$y';
    return AppLocalizations.of(context)!.todayDate(dateStr);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrubbed = ref.watch(selectedTimelineProvider) != null;

    return ColoredBox(
      color: AppColors.floorHeaderBg,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSpacing.sm),
              // ── Row 1: hamburger + date ──────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _HamburgerButton(onTap: onMenuTap),
                  Text(
                    _formattedDate(context),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              // ── Row 2: centered large time + Live chip ───────────────
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onTimeTap,
                      behavior: HitTestBehavior.opaque,
                      child: ValueListenableBuilder<int>(
                        valueListenable: minuteNotifier,
                        builder: (_, minute, __) => Text(
                          _formatTime(minute),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isScrubbed
                          ? Padding(
                              key: const ValueKey('live_chip'),
                              padding: const EdgeInsets.only(left: 8),
                              child: _LiveChip(
                                onTap: () {
                                  ref
                                      .read(selectedTimelineProvider.notifier)
                                      .state = null;
                                  onLivePressed?.call();
                                },
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              // ── Row 3: time ruler ──────────────────────────────────
              FloorTimeRuler(
                minuteNotifier: minuteNotifier,
                onTimeChanged: onTimeChanged,
              ),
              const SizedBox(height: AppSpacing.xs),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private widgets ─────────────────────────────────────────────────────────

class _HamburgerButton extends StatelessWidget {
  const _HamburgerButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primary.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return AppColors.primary.withValues(alpha: 0.05);
          }
          return null;
        }),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Image.asset(
            'assets/icons/ic_menu.png',
            width: 30,
            height: 30,
            color: AppColors.textSecondary,
            filterQuality: FilterQuality.low,
          ),
        ),
      ),
    );
  }
}

class _LiveChip extends StatelessWidget {
  const _LiveChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            '● Live',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
