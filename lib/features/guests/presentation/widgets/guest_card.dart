import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_avatar.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_info_stat_row.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({required this.guest, required this.onTap, super.key});

  final GuestEntity guest;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                  GuestAvatar(name: guest.name),
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
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    color: AppColors.textPrimary,
                    splashRadius: 20,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              const Divider(height: 1),
              const SizedBox(height: AppSpacing.md),
              GuestInfoStatRow(
                tableLabel: '-',
                visitDate: guest.lastVisit,
                guestCount: guest.visitCount,
              ),
            ],
          ),
        ),
      ),
    );
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
