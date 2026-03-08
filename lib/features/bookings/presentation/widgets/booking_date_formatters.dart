import 'package:flutter/widgets.dart';
import 'package:mehmon/l10n/app_localizations.dart';

String bookingMonthShortLabel(BuildContext context, DateTime date) {
  final loc = AppLocalizations.of(context)!;
  final labels = [
    loc.monthJan, loc.monthFeb, loc.monthMar, loc.monthApr, loc.monthMay, loc.monthJun,
    loc.monthJul, loc.monthAug, loc.monthSep, loc.monthOct, loc.monthNov, loc.monthDec,
  ];
  return labels[date.month - 1];
}

String bookingMonthLongLabel(BuildContext context, DateTime date) {
  final loc = AppLocalizations.of(context)!;
  final labels = [
    loc.monthJanuary, loc.monthFebruary, loc.monthMarch, loc.monthApril, loc.monthMayLong, loc.monthJune,
    loc.monthJuly, loc.monthAugust, loc.monthSeptember, loc.monthOctober, loc.monthNovember, loc.monthDecember,
  ];
  return labels[date.month - 1];
}

String bookingWeekdayLabel(BuildContext context, DateTime date) {
  final loc = AppLocalizations.of(context)!;
  final labels = [
    loc.weekdayMon, loc.weekdayTue, loc.weekdayWed, loc.weekdayThu, loc.weekdayFri, loc.weekdaySat, loc.weekdaySun,
  ];
  return labels[(date.weekday + 6) % DateTime.daysPerWeek];
}

String bookingTimeLabel(DateTime date) =>
    '${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';

String _twoDigits(int value) => value.toString().padLeft(2, '0');
