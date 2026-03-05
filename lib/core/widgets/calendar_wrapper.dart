import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Adapter widget isolating the Syncfusion Calendar dependency.
///
/// All calendar usage in the app should go through this wrapper so the
/// underlying library can be swapped without touching feature code.
class CalendarWrapper extends StatelessWidget {
  const CalendarWrapper({
    super.key,
    this.view = CalendarView.week,
    this.dataSource,
    this.onTap,
  });

  final CalendarView view;
  final CalendarDataSource<Object?>? dataSource;
  final CalendarTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: view,
      dataSource: dataSource,
      onTap: onTap,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
