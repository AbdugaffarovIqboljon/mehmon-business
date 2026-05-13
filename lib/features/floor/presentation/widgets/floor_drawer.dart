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
              // const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              //   child: FloorSupportButton(onTap: onSupportTap),
              // ),
              // const SizedBox(height: AppSpacing.xxl),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(
              //     AppSpacing.lg,
              //     0,
              //     AppSpacing.lg,
              //     AppSpacing.xl,
              //   ),
              //   child: Material(
              //     color: Colors.transparent,
              //     borderRadius: BorderRadius.circular(14),
              //     child: InkWell(
              //       onTap: onLogoutTap,
              //       borderRadius: BorderRadius.circular(14),
              //       splashFactory: NoSplash.splashFactory,
              //       overlayColor: WidgetStateProperty.resolveWith<Color?>((
              //         states,
              //       ) {
              //         if (states.contains(WidgetState.pressed)) {
              //           return const Color(0x0F1A1A2E);
              //         }
              //         return null;
              //       }),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: AppSpacing.sm,
              //           vertical: AppSpacing.xs,
              //         ),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Image.asset(
              //               'assets/icons/ic_logout.png',
              //               width: 26,
              //               height: 26,
              //               color: const Color(0xFF7D8698),
              //               filterQuality: FilterQuality.low,
              //             ),
              //             const SizedBox(width: AppSpacing.md),
              //             Text(
              //               AppLocalizations.of(context)!.logout,
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .titleMedium
              //                   ?.copyWith(
              //                     color: const Color(0xFF7D8698),
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 16,
              //                   ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
