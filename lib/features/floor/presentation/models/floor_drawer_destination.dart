import 'package:flutter/widgets.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/l10n/app_localizations.dart';

enum FloorDrawerSection {
  operations(title: 'Операции'),
  staffAndIntegrations(title: 'Персонал и интеграции');

  const FloorDrawerSection({required this.title});

  final String title;

  String localizedTitle(BuildContext context) {
    switch (this) {
      case FloorDrawerSection.operations:
        return AppLocalizations.of(context)!.drawerOpsGroup;
      case FloorDrawerSection.staffAndIntegrations:
        return AppLocalizations.of(context)!.drawerStaffGroup;
    }
  }
}

enum FloorDrawerDestination {
  dashboard(
    title: 'Dashboard',
    iconAsset: 'assets/icons/ic_dashboard-pen.png',
    section: FloorDrawerSection.operations,
  ),
  chronology(
    title: 'Хронология',
    iconAsset: 'assets/icons/ic_chronology.png',
    section: FloorDrawerSection.operations,
  ),
  reports(
    title: 'Отчёты',
    iconAsset: 'assets/icons/ic_reports.png',
    section: FloorDrawerSection.operations,
  ),
  shifts(
    title: 'Смены',
    iconAsset: 'assets/icons/ic_people_group.png',
    section: FloorDrawerSection.staffAndIntegrations,
  );
 

  const FloorDrawerDestination({
    required this.title,
    required this.section,
    this.iconAsset,
  });

  final String title;
  final String? iconAsset;
  final FloorDrawerSection section;

  String localizedTitle(BuildContext context) {
    switch (this) {
      case FloorDrawerDestination.dashboard:
        return AppLocalizations.of(context)!.drawerDashboard;
      case FloorDrawerDestination.chronology:
        return AppLocalizations.of(context)!.drawerChronology;
      case FloorDrawerDestination.reports:
        return AppLocalizations.of(context)!.drawerReports;
      case FloorDrawerDestination.shifts:
        return AppLocalizations.of(context)!.drawerShifts;
    }
  }
}

class FloorDrawerSectionConfig {
  const FloorDrawerSectionConfig({
    required this.section,
    required this.destinations,
  });

  final FloorDrawerSection section;
  final List<FloorDrawerDestination> destinations;
}

const List<FloorDrawerSectionConfig> floorDrawerSections = [
  FloorDrawerSectionConfig(
    section: FloorDrawerSection.operations,
    destinations: [
      FloorDrawerDestination.dashboard,
      FloorDrawerDestination.chronology,
      FloorDrawerDestination.reports,
    ],
  ),
  FloorDrawerSectionConfig(
    section: FloorDrawerSection.staffAndIntegrations,
    destinations: [
      FloorDrawerDestination.shifts,
    ],
  ),
];

extension FloorDrawerDestinationRouting on FloorDrawerDestination {
  String get routeName => switch (this) {
    FloorDrawerDestination.dashboard => RouteNames.floorDashboard,
    FloorDrawerDestination.chronology => RouteNames.floorChronology,
    FloorDrawerDestination.reports => RouteNames.floorReports,
    FloorDrawerDestination.shifts => RouteNames.floorShifts,
  };
}
