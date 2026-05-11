// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'MEHMON';

  @override
  String get continueBtn => 'Continue';

  @override
  String get languageUz => 'O\'zbekcha';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageEn => 'English';

  @override
  String get introTitle => 'Hall management\nin one screen';

  @override
  String get introSubtitle =>
      'Table statuses, visits - everything\nunder control.';

  @override
  String get loginTitle => 'Log in';

  @override
  String get nameLabel => 'Name';

  @override
  String get nameHint => 'Enter your name';

  @override
  String get nameValidationError => 'Enter your name';

  @override
  String get phoneLabel => 'Phone number';

  @override
  String get phoneHint => '+998 93 123 45 67';

  @override
  String get phoneValidationError => 'Enter your phone number';

  @override
  String get phoneInvalidError => 'Enter full phone number';

  @override
  String get loginBtn => 'Log in';

  @override
  String get registerLink => 'Register';

  @override
  String get newToApp => 'New to app?';

  @override
  String get registerTitle => 'Register';

  @override
  String get restaurantLabel => 'Cafe/Restaurant name';

  @override
  String get restaurantHint => 'Enter name';

  @override
  String get restaurantValidationError => 'Enter name';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get loginLink => 'Log in';

  @override
  String get profileSetupTitle => 'Fill restaurant profile';

  @override
  String get photoPlaceholder => 'Upload restaurant photo';

  @override
  String get restaurantTypeHint => 'Select establishment type';

  @override
  String get addressLabel => 'Address';

  @override
  String get addressHint => 'Enter address';

  @override
  String get workingHoursLabel => 'Working hours';

  @override
  String get openTimeHint => 'Opening time';

  @override
  String get closeTimeHint => 'Closing time';

  @override
  String get profileRegisterBtn => 'Register';

  @override
  String get photoPickerError => 'Failed to open gallery';

  @override
  String get restTypeCafe => 'Cafe';

  @override
  String get restTypeRestaurant => 'Restaurant';

  @override
  String get restTypeFastfood => 'Fast food';

  @override
  String get restTypeChayhana => 'Chayhana';

  @override
  String get tabFloor => 'Floor';

  @override
  String get tabBookings => 'Bookings';

  @override
  String get tabGuests => 'Guests';

  @override
  String get tabProfile => 'Profile';

  @override
  String get profileSubtitle => 'Manage your account and app settings';

  @override
  String get profileEditProfile => 'Edit Profile';

  @override
  String get profileChangeLanguage => 'Change Language';

  @override
  String get profileAboutUs => 'About Us';

  @override
  String get profileAboutDescription =>
      'MEHMON helps restaurant teams manage hall operations, bookings, and guests from one place.';

  @override
  String get profileVersionLabel => 'Version';

  @override
  String get profileCompanyInfo => 'MEHMON Team';

  @override
  String get saveBtn => 'Save';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Feb';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'Jun';

  @override
  String get monthJul => 'Jul';

  @override
  String get monthAug => 'Aug';

  @override
  String get monthSep => 'Sep';

  @override
  String get monthOct => 'Oct';

  @override
  String get monthNov => 'Nov';

  @override
  String get monthDec => 'Dec';

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMayLong => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get bookATable => 'Book a Table';

  @override
  String get guestsLabel => 'Guests';

  @override
  String get selectTime => 'Select Time';

  @override
  String get guestNameLabel => 'Guest\'s name';

  @override
  String get banquet => 'Banquet';

  @override
  String guestsCount(Object count) {
    return '$count guests';
  }

  @override
  String noBookingsOn(Object day, Object month) {
    return 'No bookings for $day $month';
  }

  @override
  String get addBookingHint => 'Add a new booking via the + button';

  @override
  String get failedToLoadBookings => 'Failed to load bookings';

  @override
  String get retryBtn => 'Retry';

  @override
  String get todayLabel => 'Today';

  @override
  String get expectedGuests => 'Expected guests';

  @override
  String get guestsInHall => 'Guests in hall';

  @override
  String get bookingsLabel => 'Bookings';

  @override
  String get supportComingSoon => 'Support will be available soon';

  @override
  String get logOutImplNextStep =>
      'Logout will be implemented in the next step';

  @override
  String get chronologyTitle => 'Chronology';

  @override
  String get noActivityYet => 'No activity yet';

  @override
  String inDevelopment(Object title) {
    return '$title is in development';
  }

  @override
  String get guestTrafficTitle => 'Guest traffic';

  @override
  String get hallOccupancyTitle => 'Hall occupancy';

  @override
  String get drawerOpsGroup => 'Operations';

  @override
  String get drawerStaffGroup => 'Staff and integrations';

  @override
  String get drawerDashboard => 'Dashboard';

  @override
  String get drawerChronology => 'Chronology';

  @override
  String get drawerReports => 'Reports';

  @override
  String get drawerShifts => 'Shifts';

  @override
  String get drawerPosIntegration => 'POS integration';

  @override
  String get drawerSettings => 'Settings';

  @override
  String get guestsEmptyInHallTitle => 'No guests in the hall right now';

  @override
  String get guestsEmptyInHallSubtitle =>
      'Guests will appear here when they enter the hall.';

  @override
  String get guestsEmptyAllTitle => 'Guest list is empty';

  @override
  String get guestsEmptyAllSubtitle => 'Add guests to track history and notes.';

  @override
  String get failedToLoadGuests => 'Failed to load guests';

  @override
  String get backBtn => 'Back';

  @override
  String get guestInfoTitle => 'Guest Information';

  @override
  String get vipGuest => 'VIP Guest';

  @override
  String get regularGuest => 'Guest';

  @override
  String get noContactInfo => 'No contact information provided';

  @override
  String get visitHistoryTitle => 'Visit History';

  @override
  String get noVisitHistory => 'No visit history yet.';

  @override
  String get notesTitle => 'Notes';

  @override
  String get noNotes => 'No notes yet.';

  @override
  String get guestNotFound => 'Guest not found';

  @override
  String statsError(String error) {
    return 'Error: $error';
  }

  @override
  String get statsTotalBookings => 'Total Bookings';

  @override
  String get statsTotalGuests => 'Total Guests';

  @override
  String get statsOccupancyRate => 'Occupancy Rate';

  @override
  String get statsRevenue => 'Revenue';

  @override
  String get statsConfirmedBookings => 'Confirmed Bookings';

  @override
  String get statsTitle => 'Statistics';

  @override
  String get statsPeriodDaily => 'Daily';

  @override
  String get statsPeriodWeekly => 'Weekly';

  @override
  String get statsPeriodMonthly => 'Monthly';

  @override
  String get viewCalendar => 'View calendar';

  @override
  String get collapse => 'Collapse';

  @override
  String todayDate(String date) {
    return 'Today $date';
  }

  @override
  String get segmentAllGuests => 'All Guests';

  @override
  String get segmentGuestsInHall => 'Guests in Hall';

  @override
  String get logout => 'Logout';

  @override
  String get support => 'Support';
}
