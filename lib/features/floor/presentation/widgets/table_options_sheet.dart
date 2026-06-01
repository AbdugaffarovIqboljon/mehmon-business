import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_form_sheet.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class TableOptionsSheet extends ConsumerStatefulWidget {
  const TableOptionsSheet({required this.table, super.key});

  final FloorEntity table;

  @override
  ConsumerState<TableOptionsSheet> createState() => _TableOptionsSheetState();
}

class _TableOptionsSheetState extends ConsumerState<TableOptionsSheet> {
  bool _isDeleting = false;

  void _openEdit() {
    Navigator.of(context).pop();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => TableFormSheet(existingTable: widget.table),
    );
  }

  Future<void> _confirmDelete() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.floor_delete_table_title),
        content: Text(l10n.floor_confirm_delete_table(widget.table.number)),
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

    if (confirmed != true || !mounted) return;

    setState(() => _isDeleting = true);
    final ok = await ref
        .read(floorControllerProvider.notifier)
        .deleteTable(id: widget.table.id);

    if (!mounted) return;
    setState(() => _isDeleting = false);

    if (ok) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.floor_delete_error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _SheetHandle(),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.floor_table_capacity_label(
                  widget.table.number, widget.table.capacity),
              style: AppTextStyles.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: Text(l10n.floor_edit_btn),
              onTap: _openEdit,
            ),
            ListTile(
              leading: _isDeleting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.error,
                      ),
                    )
                  : const Icon(Icons.delete_outline, color: AppColors.error),
              title: Text(
                l10n.floor_delete_btn,
                style: const TextStyle(color: AppColors.error),
              ),
              onTap: _isDeleting ? null : _confirmDelete,
            ),
          ],
        ),
      ),
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
