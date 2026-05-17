import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/guests/presentation/controllers/guest_controller.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_card.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_form_sheet.dart';
import 'package:mehmon/features/guests/presentation/widgets/guests_segmented_control.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class GuestsPage extends ConsumerWidget {
  const GuestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      showAppBar: false,
      usePadding: false,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_guest',
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => const GuestFormSheet(),
        ),
        child: const Icon(Icons.person_add_outlined),
      ),
      body: const _GuestsBody(),
    );
  }
}

class _GuestsBody extends ConsumerWidget {
  const _GuestsBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(guestFilterTabProvider);
    final isInHall = selectedTab == GuestFilterTab.inHall;
    final guestsAsync = isInHall
        ? ref.watch(inHallGuestsControllerProvider)
        : ref.watch(guestControllerProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xl,
        AppSpacing.lg,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.tabGuests,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GuestsSegmentedControl(
            selectedTab: selectedTab,
            onTabChanged: (tab) {
              ref.read(guestFilterTabProvider.notifier).state = tab;
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: guestsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) {
                return _GuestsErrorState(
                  error: error,
                  onRetry: isInHall
                      ? ref
                            .read(inHallGuestsControllerProvider.notifier)
                            .refresh
                      : ref.read(guestControllerProvider.notifier).refresh,
                );
              },
              data: (guests) {
                if (guests.isEmpty) {
                  return _GuestsEmptyState(
                    title: isInHall
                        ? AppLocalizations.of(context)!.guestsEmptyInHallTitle
                        : AppLocalizations.of(context)!.guestsEmptyAllTitle,
                    subtitle: isInHall
                        ? AppLocalizations.of(context)!.guestsEmptyInHallSubtitle
                        : AppLocalizations.of(context)!.guestsEmptyAllSubtitle,
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                  itemCount: guests.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.lg),
                  itemBuilder: (context, index) {
                    final guest = guests[index];
                    return GuestCard(
                      guest: guest,
                      onTap: () {
                        context.pushNamed(
                          RouteNames.guestDetail,
                          pathParameters: {RouteParams.guestId: guest.id},
                          extra: guest,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GuestsEmptyState extends StatelessWidget {
  const _GuestsEmptyState({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.people_outline_rounded,
              size: 52,
              color: AppColors.textHint,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _GuestsErrorState extends StatelessWidget {
  const _GuestsErrorState({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.failedToLoadGuests,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '$error',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: onRetry,
              child: Text(AppLocalizations.of(context)!.retryBtn),
            ),
          ],
        ),
      ),
    );
  }
}
