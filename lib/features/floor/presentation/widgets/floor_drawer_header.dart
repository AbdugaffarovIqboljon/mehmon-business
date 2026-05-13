import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';

class FloorDrawerHeader extends ConsumerWidget {
  const FloorDrawerHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileControllerProvider);

    return profileAsync.when(
      loading: () => const _DrawerHeaderSkeleton(),
      error: (_, __) => const _DrawerHeaderContent(name: 'Restoran', imageUrl: null),
      data: (profile) => _DrawerHeaderContent(
        name: profile == null
            ? 'Restoran'
            : profile.cafeName.isNotEmpty
                ? profile.cafeName
                : profile.name.isNotEmpty
                    ? profile.name
                    : 'Restoran',
        imageUrl: profile?.imageUrl,
      ),
    );
  }
}

class _DrawerHeaderContent extends StatelessWidget {
  const _DrawerHeaderContent({required this.name, required this.imageUrl});

  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.surfaceVariant,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? const Icon(Icons.store_outlined, size: 28, color: AppColors.textSecondary)
              : null,
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            name,
            style: AppTextStyles.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class _DrawerHeaderSkeleton extends StatelessWidget {
  const _DrawerHeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: Color(0xFFCED0D4),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Container(
            height: 18,
            decoration: BoxDecoration(
              color: const Color(0xFFCED0D4),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
