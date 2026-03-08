import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class BookingsFab extends StatelessWidget {
  const BookingsFab({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 65,
      child: FloatingActionButton(
        heroTag: 'bookings_fab',
        onPressed: onPressed,
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, size: 40),
      ),
    );
  }
}
