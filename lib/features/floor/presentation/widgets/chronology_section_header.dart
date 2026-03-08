import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class ChronologySectionHeader extends StatelessWidget {
  const ChronologySectionHeader({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }
}
