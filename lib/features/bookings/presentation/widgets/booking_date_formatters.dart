String bookingMonthShortLabel(DateTime date) =>
    _monthShortLabels[date.month - 1];

String bookingMonthLongLabel(DateTime date) => _monthLongLabels[date.month - 1];

String bookingWeekdayLabel(DateTime date) =>
    _weekdayLabels[(date.weekday + 6) % DateTime.daysPerWeek];

String bookingTimeLabel(DateTime date) =>
    '${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';

String _twoDigits(int value) => value.toString().padLeft(2, '0');

const _monthShortLabels = <String>[
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const _monthLongLabels = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const _weekdayLabels = <String>[
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
