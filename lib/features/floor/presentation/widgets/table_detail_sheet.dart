import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_form_sheet.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class TableDetailSheet extends ConsumerWidget {
  const TableDetailSheet({
    required this.tableId,
    required this.tableNumber,
    super.key,
  });

  final String tableId;
  final String tableNumber;

  Future<void> _openEdit(BuildContext context, WidgetRef ref) async {
    final tables = ref.read(floorControllerProvider).valueOrNull;
    FloorEntity? entity;
    if (tables != null) {
      for (final t in tables) {
        if (t.id == tableId) {
          entity = t;
          break;
        }
      }
    }
    if (entity == null) return;

    Navigator.of(context).pop();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => TableFormSheet(existingTable: entity),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.floor_delete_table_title),
        content: Text(l10n.floor_confirm_delete_table(tableNumber)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.floor_cancel_btn),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.floor_delete_btn),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final ok = await ref
        .read(floorControllerProvider.notifier)
        .deleteTable(id: tableId);

    if (!context.mounted) return;

    if (ok) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.floor_delete_error)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SheetHandle(),
            const SizedBox(height: AppSpacing.md),
            _Header(tableNumber: tableNumber),
            const SizedBox(height: AppSpacing.lg),
            _DetailsBody(tableId: tableId),
            const SizedBox(height: AppSpacing.lg),
            _ActionButtons(
              onEdit: () => _openEdit(context, ref),
              onDelete: () => _confirmDelete(context, ref),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Header ──────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.tableNumber});

  final String tableNumber;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.floor_table_title(tableNumber),
            style: AppTextStyles.titleLarge,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: AppColors.textSecondary),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: l10n.floor_close_tooltip,
        ),
      ],
    );
  }
}

// ── Body States ─────────────────────────────────────────────────────────

class _DetailsBody extends ConsumerWidget {
  const _DetailsBody({required this.tableId});

  final String tableId;

  static int _parseEnd(String endTime) {
    final p = endTime.split(':');
    return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
  }

  static int _startMin(String timeSlot) {
    final p = timeSlot.split(':');
    if (p.length < 2) return -1;
    return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
  }

  static _RowStatus _rowStatus(
    BookingEntity b,
    BookingEntity? current,
    int nowMin,
  ) {
    if (b.id == current?.id) return _RowStatus.active;
    final parts = b.timeSlot.split(':');
    if (parts.length < 2) return _RowStatus.past;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return _RowStatus.past;
    return (h * 60 + m) > nowMin ? _RowStatus.upcoming : _RowStatus.past;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final allBookings =
        ref.watch(bookingControllerProvider).valueOrNull ?? const <BookingEntity>[];

    final floorState = ref.watch(floorControllerProvider);
    final entity = floorState.valueOrNull?.firstWhereOrNull((e) => e.id == tableId);
    final tableStatus = entity?.status ?? 'free';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final todayTableBookings = allBookings.where((b) {
      if (b.status == 'cancelled') return false;
      if (b.tableInfo?.id != tableId) return false;
      final parsed = DateTime.tryParse(b.date)?.toLocal();
      if (parsed == null) return false;
      return DateTime(parsed.year, parsed.month, parsed.day) == today;
    }).toList()
      ..sort((a, b) => a.timeSlot.compareTo(b.timeSlot));

    final nowMin = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;

    final clientCurrentBooking = todayTableBookings.firstWhereOrNull((b) {
      final parts = b.timeSlot.split(':');
      if (parts.length < 2) return false;
      final h = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      if (h == null || m == null) return false;
      final start = h * 60 + m;
      final end = b.endTime != null ? _parseEnd(b.endTime!) : start + 120;
      return nowMin >= start && nowMin < end;
    });

    final hasUpcomingBooking = todayTableBookings.any(
      (b) =>
          b.status != 'cancelled' &&
          b.status != 'completed' &&
          _startMin(b.timeSlot) > nowMin,
    );

    final activeBooking = todayTableBookings.firstWhereOrNull(
      (b) => b.status != 'cancelled' && b.status != 'completed',
    );

    final banner = switch (tableStatus) {
      'reserved' => const _ReservedBanner(),
      'waiting' => const _WaitingBanner(),
      'guest_arrived' => const _GuestArrivedBanner(),
      'occupied' => const _OccupiedWithOrderBanner(),
      _ => const _FreeCard(),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        banner,
        _StatusActionButtons(
          tableId: tableId,
          tableStatus: tableStatus,
          hasUpcomingBooking: hasUpcomingBooking,
          activeBooking: activeBooking,
        ),
        if (todayTableBookings.isEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.floor_no_bookings_today,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ] else ...[
          const SizedBox(height: AppSpacing.lg),
          if (todayTableBookings.length >= 2) ...[
            Text(l10n.floor_today_bookings, style: AppTextStyles.titleMedium),
            const SizedBox(height: AppSpacing.sm),
          ],
          Column(
            children: [
              for (int i = 0; i < todayTableBookings.length; i++) ...[
                if (i > 0)
                  const Divider(height: 1, color: AppColors.divider),
                _BookingRow(
                  booking: todayTableBookings[i],
                  rowStatus: _rowStatus(
                    todayTableBookings[i],
                    clientCurrentBooking,
                    nowMin,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

enum _RowStatus { active, upcoming, past }

class _GuestArrivedBanner extends StatelessWidget {
  const _GuestArrivedBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.info,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.floor_status_arrived,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.info,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _OccupiedWithOrderBanner extends StatelessWidget {
  const _OccupiedWithOrderBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.floor_status_occupied,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReservedBanner extends StatelessWidget {
  const _ReservedBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          const Icon(Icons.event_available, color: AppColors.warning),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.floor_status_reserved,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.warning,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _WaitingBanner extends StatelessWidget {
  const _WaitingBanner();

  static const _purple = Color(0xFF7C3AED);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: _purple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: _purple),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.floor_status_waiting,
            style: AppTextStyles.titleMedium.copyWith(
              color: _purple,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingRow extends StatelessWidget {
  const _BookingRow({required this.booking, required this.rowStatus});

  final BookingEntity booking;
  final _RowStatus rowStatus;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final timeRange = '${booking.timeSlot}–${booking.endTime ?? '?'}';
    final name =
        booking.guestName.trim().isEmpty ? l10n.regularGuest : booking.guestName;
    final dotColor = switch (rowStatus) {
      _RowStatus.active => AppColors.error,
      _RowStatus.upcoming => AppColors.warning,
      _RowStatus.past => AppColors.textSecondary,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(timeRange, style: AppTextStyles.labelLarge),
          const Spacer(),
          Text(name, style: AppTextStyles.bodyLarge),
          const Spacer(),
          Text(l10n.floor_guests_kishi(booking.numberOfGuests), style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

class _FreeCard extends StatelessWidget {
  const _FreeCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.success,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.floor_table_free,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}


// ── Status Actions (hostes flow) ──────────────────────────────────────────

class _StatusActionButtons extends ConsumerStatefulWidget {
  const _StatusActionButtons({
    required this.tableId,
    required this.tableStatus,
    required this.hasUpcomingBooking,
    required this.activeBooking,
  });

  final String tableId;
  final String tableStatus;
  final bool hasUpcomingBooking;
  final BookingEntity? activeBooking;

  @override
  ConsumerState<_StatusActionButtons> createState() =>
      _StatusActionButtonsState();
}

class _StatusActionButtonsState extends ConsumerState<_StatusActionButtons> {
  final ValueNotifier<bool> _busy = ValueNotifier<bool>(false);

  static const _grey = AppColors.textSecondary;

  @override
  void dispose() {
    _busy.dispose();
    super.dispose();
  }

  Future<void> _apply(String newStatus, {String? bookingStatus}) async {
    if (_busy.value) return;
    _busy.value = true;
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context)!;

    await ref
        .read(floorControllerProvider.notifier)
        .updateTableStatus(widget.tableId, newStatus);

    if (!mounted) {
      _busy.value = false;
      return;
    }

    // The controller silently reverts its state on API error; if the table
    // status did not land on the requested value, the update failed.
    final current = ref
        .read(floorControllerProvider)
        .valueOrNull
        ?.firstWhereOrNull((e) => e.id == widget.tableId)
        ?.status;
    if (current != newStatus) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.floor_save_error)));
      _busy.value = false;
      return;
    }

    if (bookingStatus != null && widget.activeBooking != null) {
      final ok = await ref
          .read(bookingControllerProvider.notifier)
          .updateBookingStatus(widget.activeBooking!, bookingStatus);

      if (!mounted) {
        _busy.value = false;
        return;
      }

      if (!ok) {
        messenger.showSnackBar(SnackBar(content: Text(l10n.floor_save_error)));
      }
    }

    _busy.value = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tableStatus == 'free' && !widget.hasUpcomingBooking) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: ValueListenableBuilder<bool>(
        valueListenable: _busy,
        builder: (context, busy, _) => _content(busy),
      ),
    );
  }

  Widget _content(bool busy) {
    final l10n = AppLocalizations.of(context)!;
    switch (widget.tableStatus) {
      case 'free':
        if (!widget.hasUpcomingBooking) return const SizedBox.shrink();
        return _StatusButton(
          label: l10n.floor_action_reserve,
          icon: Icons.event_available,
          filled: false,
          color: AppColors.warning,
          onPressed: busy ? null : () => _apply('reserved'),
        );
      case 'reserved':
      case 'waiting':
        return _StatusButton(
          label: l10n.floor_action_mark_arrived,
          icon: Icons.person_add_alt_1,
          filled: true,
          color: AppColors.info,
          onPressed: busy
              ? null
              : () => _apply('guest_arrived', bookingStatus: 'arrived'),
        );
      case 'guest_arrived':
        return Row(
          children: [
            Expanded(
              child: _StatusButton(
                label: l10n.floor_action_mark_occupied,
                icon: Icons.receipt_long,
                filled: true,
                color: AppColors.error,
                onPressed: busy ? null : () => _apply('occupied'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _StatusButton(
                label: l10n.floor_action_checkout,
                icon: Icons.exit_to_app,
                filled: false,
                color: _grey,
                onPressed: busy
                    ? null
                    : () => _apply('free', bookingStatus: 'completed'),
              ),
            ),
          ],
        );
      case 'occupied':
        return _StatusButton(
          label: l10n.floor_action_checkout,
          icon: Icons.exit_to_app,
          filled: false,
          color: _grey,
          onPressed: busy
              ? null
              : () => _apply('free', bookingStatus: 'completed'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _StatusButton extends StatelessWidget {
  const _StatusButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (filled) {
      return FilledButton.icon(
        onPressed: onPressed,
        style: FilledButton.styleFrom(backgroundColor: color),
        icon: Icon(icon),
        label: Text(label),
      );
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

// ── Actions ─────────────────────────────────────────────────────────────

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({required this.onEdit, required this.onDelete});

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
            label: Text(l10n.floor_edit_btn),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onDelete,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
            ),
            icon: const Icon(Icons.delete_outline),
            label: Text(l10n.floor_delete_btn),
          ),
        ),
      ],
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.divider,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),
    );
  }
}
