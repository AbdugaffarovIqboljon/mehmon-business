import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/shell/presentation/models/shell_tab_item.dart';
import 'package:mehmon/features/shell/presentation/widgets/main_bottom_navigation_bar.dart';

/// Root shell for authenticated users with persistent bottom-tab navigation.
class MainShellPage extends StatelessWidget {
  const MainShellPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: navigationShell,
      bottomNavigationBar: MainBottomNavigationBar(
        items: ShellTabItems.authenticated,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
