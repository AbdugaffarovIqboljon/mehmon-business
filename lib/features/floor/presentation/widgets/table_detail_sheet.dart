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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Stolni o'chirish"),
        content: Text(
          '"$tableNumber" stolini o\'chirishni tasdiqlaysizmi?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Bekor qilish'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text("O'chirish"),
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
        const SnackBar(content: Text("O'chirishda xatolik yuz berdi")),
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
    return Row(
      children: [
        Expanded(
          child: Text(
            'Stol $tableNumber',
            style: AppTextStyles.titleLarge,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: AppColors.textSecondary),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Yopish',
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
    final allBookings =
        ref.watch(bookingControllerProvider).valueOrNull ?? const <BookingEntity>[];

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (clientCurrentBooking != null)
          const _OccupiedBanner()
        else
          const _FreeCard(),
        if (todayTableBookings.isEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          const Text(
            "Bugun bron yo'q",
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ] else ...[
          const SizedBox(height: AppSpacing.lg),
          if (todayTableBookings.length >= 2) ...[
            const Text('Bugungi bronlar', style: AppTextStyles.titleMedium),
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

class _OccupiedBanner extends StatelessWidget {
  const _OccupiedBanner();

  @override
  Widget build(BuildContext context) {
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
            'Stol band',
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

class _BookingRow extends StatelessWidget {
  const _BookingRow({required this.booking, required this.rowStatus});

  final BookingEntity booking;
  final _RowStatus rowStatus;

  @override
  Widget build(BuildContext context) {
    final timeRange = '${booking.timeSlot}–${booking.endTime ?? '?'}';
    final name =
        booking.guestName.trim().isEmpty ? 'Mehmon' : booking.guestName;
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
          Text('${booking.numberOfGuests} kishi', style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

class _FreeCard extends StatelessWidget {
  const _FreeCard();

  @override
  Widget build(BuildContext context) {
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
            "Stol bo'sh",
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


// ── Actions ─────────────────────────────────────────────────────────────

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({required this.onEdit, required this.onDelete});

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Tahrirlash'),
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
            label: const Text("O'chirish"),
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
