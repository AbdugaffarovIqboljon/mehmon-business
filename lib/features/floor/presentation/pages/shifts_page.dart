import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_error_view.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.floor_confirm_delete_title),
        content: Text(l10n.floor_confirm_delete_shift(shift.staffName)),
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
        error: (error, _) => AppErrorView(
          error: error,
          onRetry: () {
            ref.read(shiftsControllerProvider.notifier).fetchShifts();
          },
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
                children: [
                  const SizedBox(height: 120),
                  Center(
                    child: Text(
                      l10n.floor_no_shifts,
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
