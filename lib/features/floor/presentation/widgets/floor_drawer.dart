import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/features/floor/presentation/models/floor_drawer_destination.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer_header.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer_section.dart';

class FloorDrawer extends StatelessWidget {
  const FloorDrawer({
    required this.onDestinationTap,
    required this.onSupportTap,
    required this.onLogoutTap,
    super.key,
  });

  final ValueChanged<FloorDrawerDestination> onDestinationTap;
  final VoidCallback onSupportTap;
  final VoidCallback onLogoutTap;

  @override
  Widget build(BuildContext context) {
    final drawerWidth = math.min<double>(
      MediaQuery.sizeOf(context).width * 0.82,
      360,
    );

    return Drawer(
      width: drawerWidth,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34),
          bottomRight: Radius.circular(34),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFFAFAFB)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.xl,
                ),
                child: FloorDrawerHeader(),
              ),
              FloorDrawerSectionBlock(
                title: floorDrawerSections[0].section.localizedTitle(context),
                destinations: floorDrawerSections[0].destinations,
                onDestinationTap: onDestinationTap,
              ),
              const SizedBox(height: AppSpacing.md),
              const Divider(color: Color(0xFFE1E4EA), height: 1),
              const SizedBox(height: AppSpacing.md),
              FloorDrawerSectionBlock(
                title: floorDrawerSections[1].section.localizedTitle(context),
                destinations: floorDrawerSections[1].destinations,
                onDestinationTap: onDestinationTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
