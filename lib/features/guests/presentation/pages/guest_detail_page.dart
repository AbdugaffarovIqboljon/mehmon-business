import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/controllers/guest_controller.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_avatar.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_contact_row.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_notes_card.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_visit_history_card.dart';

class GuestDetailPage extends ConsumerWidget {
  const GuestDetailPage({
    required this.guestId,
    super.key,
    this.initialGuest,
  });

  final String guestId;
  final GuestEntity? initialGuest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guestsAsync = ref.watch(guestControllerProvider);
    final guest = initialGuest ?? ref.watch(guestByIdProvider(guestId));

    if (guest == null) {
      return AppScaffold(
        showAppBar: false,
        usePadding: false,
        body: guestsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => _GuestNotFoundState(onBack: context.pop),
          data: (_) => _GuestNotFoundState(onBack: context.pop),
        ),
      );
    }

    final contacts = <Widget>[];
    if (guest.phone != null && guest.phone!.trim().isNotEmpty) {
      contacts.add(GuestContactRow(icon: Icons.call_outlined, value: guest.phone!));
    }
    if (guest.email != null && guest.email!.trim().isNotEmpty) {
      if (contacts.isNotEmpty) {
        contacts.add(const SizedBox(height: AppSpacing.md));
      }
      contacts.add(
        GuestContactRow(icon: Icons.mail_outline_rounded, value: guest.email!),
      );
    }

    return AppScaffold(
      showAppBar: false,
      usePadding: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: context.pop,
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 36,
                        color: const Color(0xFF393B3F),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    Text(
                      'Информация о госте',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: GuestAvatar(
                    name: guest.name,
                    imageUrl: guest.avatarUrl,
                    radius: 84,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Center(
                child: Text(
                  guest.name,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Center(
                child: Text(
                  guest.isVip ? 'VIP Гость' : 'Гость',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: guest.isVip ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              if (contacts.isNotEmpty) ...contacts,
              if (contacts.isEmpty)
                const GuestContactRow(
                  icon: Icons.info_outline_rounded,
                  value: 'Контактные данные не указаны',
                ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'История посещений',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF0F1F36),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (guest.visitHistory.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    'История посещений пока отсутствует.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              else
                ...guest.visitHistory.map(
                  (visit) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: GuestVisitHistoryCard(visit: visit),
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Заметки',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF0F1F36),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              GuestNotesCard(
                notes: (guest.notes == null || guest.notes!.trim().isEmpty)
                    ? 'Заметок пока нет.'
                    : guest.notes!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuestNotFoundState extends StatelessWidget {
  const _GuestNotFoundState({
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Гость не найден',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: onBack,
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
