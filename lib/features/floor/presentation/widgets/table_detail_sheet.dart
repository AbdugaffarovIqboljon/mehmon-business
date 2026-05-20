import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/table_details_entity.dart';
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
    final detailsAsync = ref.watch(tableDetailsProvider(tableId));

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
            detailsAsync.when(
              loading: () => const _LoadingSkeleton(),
              error: (err, _) => _ErrorView(
                message: err.toString(),
                onRetry: () => ref.invalidate(tableDetailsProvider(tableId)),
              ),
              data: (details) => _DetailsBody(details: details),
            ),
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

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({required this.details});

  final TableDetailsEntity details;

  // endTime < 06:00 is treated as a next-day booking (crosses midnight).
  // Same-day bookings get a 30min grace window after endTime.
  static bool _isCurrentlyActive(TableCurrentBookingEntity booking) {
    if (booking.endTime == null) return true;
    try {
      final now = TimeOfDay.now();
      final nowMin = now.hour * 60 + now.minute;
      final parts = booking.endTime!.split(':');
      final endHour = int.parse(parts[0]);
      final endMin = int.parse(parts[1]);
      final endTotalMin = endHour * 60 + endMin;

      if (endHour < 6) {
        return nowMin <= endTotalMin;
      }
      return nowMin <= endTotalMin + 30;
    } on Object {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rawCurrent = details.currentBooking;
    final activeCurrent =
        (rawCurrent != null && _isCurrentlyActive(rawCurrent))
            ? rawCurrent
            : null;
    final upcoming = details.upcomingBookings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (activeCurrent != null)
          _OccupiedCard(booking: activeCurrent)
        else
          const _FreeCard(),
        if (upcoming.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.lg),
          const Text('Bugungi bronlar', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: upcoming.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: AppColors.divider),
            itemBuilder: (_, i) => _UpcomingRow(booking: upcoming[i]),
          ),
        ] else if (activeCurrent == null) ...[
          const SizedBox(height: AppSpacing.md),
          const Text(
            "Bugun bron yo'q",
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

class _OccupiedCard extends StatelessWidget {
  const _OccupiedCard({required this.booking});

  final TableCurrentBookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final endLabel = booking.endTime != null
        ? '${booking.timeSlot} → ${booking.endTime}'
        : booking.timeSlot;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: AppColors.error,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: const Text(
              'Hozir band',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 18,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  booking.guestName,
                  style: AppTextStyles.titleMedium,
                ),
              ),
              Text(
                '${booking.numberOfGuests} kishi',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(endLabel, style: AppTextStyles.bodyMedium),
            ],
          ),
          if (booking.notes != null && booking.notes!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(booking.notes!, style: AppTextStyles.bodySmall),
          ],
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

class _UpcomingRow extends StatelessWidget {
  const _UpcomingRow({required this.booking});

  final TableUpcomingBookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(booking.timeSlot, style: AppTextStyles.labelLarge),
          ),
          Expanded(
            child: Text(booking.guestName, style: AppTextStyles.bodyLarge),
          ),
          Text(
            '${booking.numberOfGuests} kishi',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ── Loading / Error ─────────────────────────────────────────────────────

class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SkeletonRow(height: 64),
        SizedBox(height: AppSpacing.sm),
        _SkeletonRow(height: 40),
        SizedBox(height: AppSpacing.sm),
        _SkeletonRow(height: 40),
      ],
    );
  }
}

class _SkeletonRow extends StatelessWidget {
  const _SkeletonRow({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ma'lumotlarni yuklab bo'lmadi",
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Qayta urinish'),
        ),
      ],
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
