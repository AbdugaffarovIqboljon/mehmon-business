import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';

/// Placeholder bookings page.
class BookingsPage extends ConsumerWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsAsync = ref.watch(bookingControllerProvider);

    return AppScaffold(
      title: 'Bookings',
      body: bookingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (bookings) => ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return ListTile(
              title: Text(booking.guestName),
              subtitle: Text(
                'Party of ${booking.partySize} · ${booking.status}',
              ),
              trailing: Text(
                '${booking.dateTime.hour}:${booking.dateTime.minute.toString().padLeft(2, '0')}',
              ),
              leading: const Icon(Icons.calendar_today),
            );
          },
        ),
      ),
    );
  }
}
