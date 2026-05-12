import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_event_icon.dart';

class ActivityEventCard extends StatelessWidget {
  const ActivityEventCard({required this.entity, super.key});

  final ActivityLogEntity entity;

  static ChronologyEventType _typeFromType(String type) {
    return switch (type) {
      'booking_cancelled' => ChronologyEventType.reservationCancelled,
      'booking_updated' => ChronologyEventType.reservationUpdated,
      'check_in' => ChronologyEventType.guestArrived,
      _ => ChronologyEventType.reservationCreated,
    };
  }

  static String _formatTime(String createdAt) {
    final parsed = DateTime.tryParse(createdAt)?.toLocal();
    if (parsed == null) {
      return '';
    }
    final hh = parsed.hour.toString().padLeft(2, '0');
    final mm = parsed.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
  }

  @override
  Widget build(BuildContext context) {
    final type = _typeFromType(entity.type);
    final time = _formatTime(entity.createdAt);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.055),
            blurRadius: 14,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChronologyEventIcon(type: type),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          entity.action,
                          style: AppTextStyles.titleLarge.copyWith(height: 1.25),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (time.isNotEmpty) ...[
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          time,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (entity.details.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      entity.details,
                      style: AppTextStyles.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (entity.performedBy.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      entity.performedBy,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
