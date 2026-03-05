import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/guests/presentation/controllers/guest_controller.dart';

/// Placeholder guests page.
class GuestsPage extends ConsumerWidget {
  const GuestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guestsAsync = ref.watch(guestControllerProvider);

    return AppScaffold(
      title: 'Guests',
      body: guestsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (guests) => ListView.builder(
          itemCount: guests.length,
          itemBuilder: (context, index) {
            final guest = guests[index];
            return ListTile(
              title: Text(guest.name),
              subtitle: Text(
                '${guest.visitCount} visits${guest.isVip ? ' · VIP' : ''}',
              ),
              leading: CircleAvatar(child: Text(guest.name[0])),
              trailing: guest.isVip
                  ? const Icon(Icons.star, color: Colors.amber)
                  : null,
            );
          },
        ),
      ),
    );
  }
}
