import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/add_shift_sheet.dart';
import 'package:mehmon/features/floor/presentation/widgets/shift_card.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class ShiftsPage extends ConsumerWidget {
  const ShiftsPage({super.key});

  Future<void> _openSheet(
    BuildContext context,
    WidgetRef ref, {
    ShiftEntity? shift,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      builder: (_) => AddShiftSheet(existingShift: shift),
    );
    if (context.mounted) {
      await ref.read(shiftsControllerProvider.notifier).fetchShifts();
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    ShiftEntity shift,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("O'chirishni tasdiqlang"),
        content: Text("${shift.staffName} smenasini o'chirasizmi?"),
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
    if (confirm ?? false) {
      await ref.read(shiftsControllerProvider.notifier).removeShift(shift.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncShifts = ref.watch(shiftsControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return AppScaffold(
      title: l10n.drawerShifts,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSheet(context, ref),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: asyncShifts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ShiftsError(
          message: error.toString(),
          onRetry: () =>
              ref.read(shiftsControllerProvider.notifier).fetchShifts(),
        ),
        data: (shifts) {
          if (shifts.isEmpty) {
            return RefreshIndicator(
              onRefresh: () =>
                  ref.read(shiftsControllerProvider.notifier).fetchShifts(),
              child: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: const [
                  SizedBox(height: 120),
                  Center(
                    child: Text(
                      "Smenalar yo'q",
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(shiftsControllerProvider.notifier).fetchShifts(),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.only(
                top: AppSpacing.sm,
                bottom: AppSpacing.xxxl,
              ),
              itemCount: shifts.length,
              itemBuilder: (context, index) {
                final shift = shifts[index];
                return ShiftCard(
                  key: ValueKey(shift.id),
                  shift: shift,
                  onDelete: () => _confirmDelete(context, ref, shift),
                  onEdit: () => _openSheet(context, ref, shift: shift),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ShiftsError extends StatelessWidget {
  const _ShiftsError({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
