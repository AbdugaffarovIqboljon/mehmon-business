import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_avatar.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_info_stat_row.dart';

class GuestCard extends ConsumerWidget {
  const GuestCard({
    required this.guest,
    required this.onTap,
    this.isInHall = false,
    super.key,
  });

  final GuestEntity guest;
  final VoidCallback onTap;
  final bool isInHall;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondaryText = _buildSecondaryText(guest);

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GuestAvatar(name: guest.name, avatarUrl: guest.avatarUrl),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          guest.name,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    height: 1.25,
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          secondaryText,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textHint,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.3,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (isInHall) ...[
                          const SizedBox(height: AppSpacing.xs),
                          _InHallContextRow(guest: guest),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              if (!isInHall) ...[
                const SizedBox(height: AppSpacing.md),
                const Divider(height: 1),
                const SizedBox(height: AppSpacing.md),
                GuestInfoStatRow(
                  tableLabel: guest.lastVisitTableNumber ?? '-',
                  visitDate: _formatDate(guest.lastVisit),
                  guestCount: guest.lastVisitGuestCount,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    if (isoDate.trim().isEmpty) return '-';
    try {
      return DateFormat('dd.MM.yy').format(DateTime.parse(isoDate));
    } on FormatException {
      return '-';
    }
  }

  String _buildSecondaryText(GuestEntity guest) {
    final phone = guest.phone;
    if (phone.trim().isNotEmpty) {
      return phone;
    }

    final email = guest.email;
    if (email != null && email.trim().isNotEmpty) {
      return email;
    }

    return 'Контакт не указан';
  }
}

class _InHallContextRow extends ConsumerWidget {
  const _InHallContextRow({required this.guest});

  final GuestEntity guest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tables =
        ref.watch(floorControllerProvider).valueOrNull ?? const <FloorEntity>[];
    final tableDisplay = _resolveTableDisplay(tables, guest.currentTableId);
    final timeSlot = guest.bookingTimeSlot?.trim();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.table_restaurant_outlined,
          size: 14,
          color: AppColors.primary,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            tableDisplay,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (timeSlot != null && timeSlot.isNotEmpty) ...[
          const SizedBox(width: 8),
          Text(
            timeSlot,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textHint,
            ),
          ),
        ],
      ],
    );
  }

  String _resolveTableDisplay(List<FloorEntity> tables, String? tableId) {
    if (tableId == null || tableId.isEmpty) return 'Stol —';
    final match = tables
        .cast<FloorEntity?>()
        .firstWhere((t) => t!.id == tableId, orElse: () => null);
    if (match != null) {
      return 'Stol ${match.displayNumber}';
    }
    final preview =
        tableId.length > 6 ? '${tableId.substring(0, 6)}...' : tableId;
    return 'Stol ($preview)';
  }
}
