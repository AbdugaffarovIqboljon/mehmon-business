import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class FloorPlaceholderPage extends StatelessWidget {
  const FloorPlaceholderPage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.inDevelopment(title),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
