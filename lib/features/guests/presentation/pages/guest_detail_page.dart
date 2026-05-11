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
import 'package:mehmon/features/guests/presentation/widgets/guest_form_sheet.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_notes_card.dart';
import 'package:mehmon/features/guests/presentation/widgets/guest_visit_history_card.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class GuestDetailPage extends ConsumerWidget {
  const GuestDetailPage({required this.guestId, super.key, this.initialGuest});

  final String guestId;
  final GuestEntity? initialGuest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(guestDetailProvider(guestId));
    final guest = detailAsync.asData?.value
        ?? initialGuest
        ?? ref.watch(guestByIdProvider(guestId));

    if (guest == null) {
      return AppScaffold(
        showAppBar: false,
        usePadding: false,
        body: detailAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => _GuestNotFoundState(onBack: context.pop),
          data: (_) => _GuestNotFoundState(onBack: context.pop),
        ),
      );
    }

    Future<void> confirmDelete() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Mehmonni o'chirish"),
          content: Text("${guest.name} o'chirilsinmi?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              child: const Text("O'chirish"),
            ),
          ],
        ),
      );

      if (confirmed ?? false) {
        await ref
            .read(guestControllerProvider.notifier)
            .deleteGuest(id: guest.id);
        if (context.mounted) context.pop();
      }
    }

    final contacts = <Widget>[];
    if (guest.phone.trim().isNotEmpty) {
      contacts.add(
        GuestContactRow(icon: Icons.call_outlined, value: guest.phone),
      );
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
      usePadding: false,
      title: AppLocalizations.of(context)!.guestInfoTitle,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () => showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => GuestFormSheet(existingGuest: guest),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          color: AppColors.error,
          onPressed: confirmDelete,
        ),
      ],
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
              const SizedBox(height: AppSpacing.xl),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: GuestAvatar(
                    name: guest.name,
                    avatarUrl: guest.avatarUrl,
                    radius: 84,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Center(
                child: Text(
                  guest.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 1.25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Center(
                child: Text(
                  guest.isVIP
                      ? AppLocalizations.of(context)!.vipGuest
                      : AppLocalizations.of(context)!.regularGuest,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: guest.isVIP
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              if (contacts.isNotEmpty) ...contacts,
              if (contacts.isEmpty)
                GuestContactRow(
                  icon: Icons.info_outline_rounded,
                  value: AppLocalizations.of(context)!.noContactInfo,
                ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                AppLocalizations.of(context)!.visitHistoryTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF0F1F36),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              GuestVisitHistoryCard(visits: guest.visits),
              const SizedBox(height: AppSpacing.md),
              Text(
                AppLocalizations.of(context)!.notesTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF0F1F36),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              GuestNotesCard(
                notes: (guest.notes == null || guest.notes!.trim().isEmpty)
                    ? AppLocalizations.of(context)!.noNotes
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
  const _GuestNotFoundState({required this.onBack});

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
              AppLocalizations.of(context)!.guestNotFound,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: onBack,
              child: Text(AppLocalizations.of(context)!.backBtn),
            ),
          ],
        ),
      ),
    );
  }
}
