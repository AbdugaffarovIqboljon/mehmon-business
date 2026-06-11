import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'MEHMON'**
  String get appName;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @languageUz.
  ///
  /// In en, this message translates to:
  /// **'O\'zbekcha'**
  String get languageUz;

  /// No description provided for @languageRu.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get languageRu;

  /// No description provided for @languageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @introTitle.
  ///
  /// In en, this message translates to:
  /// **'Hall management\nin one screen'**
  String get introTitle;

  /// No description provided for @introSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Table statuses, visits - everything\nunder control.'**
  String get introSubtitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginTitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get nameHint;

  /// No description provided for @nameValidationError.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameValidationError;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'+998 93 123 45 67'**
  String get phoneHint;

  /// No description provided for @phoneValidationError.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneValidationError;

  /// No description provided for @phoneInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Enter full phone number'**
  String get phoneInvalidError;

  /// No description provided for @loginBtn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginBtn;

  /// No description provided for @registerLink.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerLink;

  /// No description provided for @newToApp.
  ///
  /// In en, this message translates to:
  /// **'New to app?'**
  String get newToApp;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// No description provided for @restaurantLabel.
  ///
  /// In en, this message translates to:
  /// **'Cafe/Restaurant name'**
  String get restaurantLabel;

  /// No description provided for @restaurantHint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get restaurantHint;

  /// No description provided for @restaurantValidationError.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get restaurantValidationError;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @loginLink.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginLink;

  /// No description provided for @profileSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Fill restaurant profile'**
  String get profileSetupTitle;

  /// No description provided for @photoPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Upload restaurant photo'**
  String get photoPlaceholder;

  /// No description provided for @restaurantTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select establishment type'**
  String get restaurantTypeHint;

  /// No description provided for @addressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressLabel;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get addressHint;

  /// No description provided for @workingHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Working hours'**
  String get workingHoursLabel;

  /// No description provided for @openTimeHint.
  ///
  /// In en, this message translates to:
  /// **'Opening time'**
  String get openTimeHint;

  /// No description provided for @closeTimeHint.
  ///
  /// In en, this message translates to:
  /// **'Closing time'**
  String get closeTimeHint;

  /// No description provided for @profileRegisterBtn.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get profileRegisterBtn;

  /// No description provided for @photoPickerError.
  ///
  /// In en, this message translates to:
  /// **'Failed to open gallery'**
  String get photoPickerError;

  /// No description provided for @restTypeCafe.
  ///
  /// In en, this message translates to:
  /// **'Cafe'**
  String get restTypeCafe;

  /// No description provided for @restTypeRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restTypeRestaurant;

  /// No description provided for @restTypeFastfood.
  ///
  /// In en, this message translates to:
  /// **'Fast food'**
  String get restTypeFastfood;

  /// No description provided for @restTypeChayhana.
  ///
  /// In en, this message translates to:
  /// **'Chayhana'**
  String get restTypeChayhana;

  /// No description provided for @tabFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get tabFloor;

  /// No description provided for @tabBookings.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get tabBookings;

  /// No description provided for @tabGuests.
  ///
  /// In en, this message translates to:
  /// **'Guests'**
  String get tabGuests;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @profileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your account and app settings'**
  String get profileSubtitle;

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditProfile;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguage;

  /// No description provided for @profileAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get profileAboutUs;

  /// No description provided for @profileAboutDescription.
  ///
  /// In en, this message translates to:
  /// **'MEHMON helps restaurant teams manage hall operations, bookings, and guests from one place.'**
  String get profileAboutDescription;

  /// No description provided for @profileVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get profileVersionLabel;

  /// No description provided for @profileCompanyInfo.
  ///
  /// In en, this message translates to:
  /// **'MEHMON Team'**
  String get profileCompanyInfo;

  /// No description provided for @saveBtn.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveBtn;

  /// No description provided for @monthJan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get monthJan;

  /// No description provided for @monthFeb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get monthFeb;

  /// No description provided for @monthMar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get monthMar;

  /// No description provided for @monthApr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get monthApr;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get monthJun;

  /// No description provided for @monthJul.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get monthJul;

  /// No description provided for @monthAug.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get monthAug;

  /// No description provided for @monthSep.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get monthSep;

  /// No description provided for @monthOct.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get monthOct;

  /// No description provided for @monthNov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get monthNov;

  /// No description provided for @monthDec.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get monthDec;

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMayLong.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMayLong;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// No description provided for @weekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdaySun;

  /// No description provided for @bookATable.
  ///
  /// In en, this message translates to:
  /// **'Book a Table'**
  String get bookATable;

  /// No description provided for @guestsLabel.
  ///
  /// In en, this message translates to:
  /// **'Guests'**
  String get guestsLabel;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// No description provided for @guestNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Guest\'s name'**
  String get guestNameLabel;

  /// No description provided for @banquet.
  ///
  /// In en, this message translates to:
  /// **'Banquet'**
  String get banquet;

  /// No description provided for @guestsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} guests'**
  String guestsCount(Object count);

  /// No description provided for @noBookingsOn.
  ///
  /// In en, this message translates to:
  /// **'No bookings for {day} {month}'**
  String noBookingsOn(Object day, Object month);

  /// No description provided for @addBookingHint.
  ///
  /// In en, this message translates to:
  /// **'Add a new booking via the + button'**
  String get addBookingHint;

  /// No description provided for @failedToLoadBookings.
  ///
  /// In en, this message translates to:
  /// **'Failed to load bookings'**
  String get failedToLoadBookings;

  /// No description provided for @retryBtn.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryBtn;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// No description provided for @expectedGuests.
  ///
  /// In en, this message translates to:
  /// **'Expected guests'**
  String get expectedGuests;

  /// No description provided for @guestsInHall.
  ///
  /// In en, this message translates to:
  /// **'Guests in hall'**
  String get guestsInHall;

  /// No description provided for @bookingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get bookingsLabel;

  /// No description provided for @supportComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Support will be available soon'**
  String get supportComingSoon;

  /// No description provided for @logOutImplNextStep.
  ///
  /// In en, this message translates to:
  /// **'Logout will be implemented in the next step'**
  String get logOutImplNextStep;

  /// No description provided for @chronologyTitle.
  ///
  /// In en, this message translates to:
  /// **'Chronology'**
  String get chronologyTitle;

  /// No description provided for @noActivityYet.
  ///
  /// In en, this message translates to:
  /// **'No activity yet'**
  String get noActivityYet;

  /// No description provided for @inDevelopment.
  ///
  /// In en, this message translates to:
  /// **'{title} is in development'**
  String inDevelopment(Object title);

  /// No description provided for @guestTrafficTitle.
  ///
  /// In en, this message translates to:
  /// **'Guest traffic'**
  String get guestTrafficTitle;

  /// No description provided for @hallOccupancyTitle.
  ///
  /// In en, this message translates to:
  /// **'Hall occupancy'**
  String get hallOccupancyTitle;

  /// No description provided for @drawerOpsGroup.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get drawerOpsGroup;

  /// No description provided for @drawerStaffGroup.
  ///
  /// In en, this message translates to:
  /// **'Staff and integrations'**
  String get drawerStaffGroup;

  /// No description provided for @drawerDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get drawerDashboard;

  /// No description provided for @drawerChronology.
  ///
  /// In en, this message translates to:
  /// **'Chronology'**
  String get drawerChronology;

  /// No description provided for @drawerReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get drawerReports;

  /// No description provided for @drawerShifts.
  ///
  /// In en, this message translates to:
  /// **'Shifts'**
  String get drawerShifts;

  /// No description provided for @drawerPosIntegration.
  ///
  /// In en, this message translates to:
  /// **'POS integration'**
  String get drawerPosIntegration;

  /// No description provided for @drawerSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawerSettings;

  /// No description provided for @guestsEmptyInHallTitle.
  ///
  /// In en, this message translates to:
  /// **'No guests in the hall right now'**
  String get guestsEmptyInHallTitle;

  /// No description provided for @guestsEmptyInHallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guests will appear here when they enter the hall.'**
  String get guestsEmptyInHallSubtitle;

  /// No description provided for @guestsEmptyAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Guest list is empty'**
  String get guestsEmptyAllTitle;

  /// No description provided for @guestsEmptyAllSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add guests to track history and notes.'**
  String get guestsEmptyAllSubtitle;

  /// No description provided for @failedToLoadGuests.
  ///
  /// In en, this message translates to:
  /// **'Failed to load guests'**
  String get failedToLoadGuests;

  /// No description provided for @backBtn.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backBtn;

  /// No description provided for @guestInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Guest Information'**
  String get guestInfoTitle;

  /// No description provided for @vipGuest.
  ///
  /// In en, this message translates to:
  /// **'VIP Guest'**
  String get vipGuest;

  /// No description provided for @regularGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get regularGuest;

  /// No description provided for @noContactInfo.
  ///
  /// In en, this message translates to:
  /// **'No contact information provided'**
  String get noContactInfo;

  /// No description provided for @visitHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Visit History'**
  String get visitHistoryTitle;

  /// No description provided for @noVisitHistory.
  ///
  /// In en, this message translates to:
  /// **'No visit history yet.'**
  String get noVisitHistory;

  /// No description provided for @notesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesTitle;

  /// No description provided for @noNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes yet.'**
  String get noNotes;

  /// No description provided for @guestNotFound.
  ///
  /// In en, this message translates to:
  /// **'Guest not found'**
  String get guestNotFound;

  /// No description provided for @statsError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String statsError(String error);

  /// No description provided for @statsTotalBookings.
  ///
  /// In en, this message translates to:
  /// **'Total Bookings'**
  String get statsTotalBookings;

  /// No description provided for @statsTotalGuests.
  ///
  /// In en, this message translates to:
  /// **'Total Guests'**
  String get statsTotalGuests;

  /// No description provided for @statsOccupancyRate.
  ///
  /// In en, this message translates to:
  /// **'Occupancy Rate'**
  String get statsOccupancyRate;

  /// No description provided for @statsRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get statsRevenue;

  /// No description provided for @statsConfirmedBookings.
  ///
  /// In en, this message translates to:
  /// **'Confirmed Bookings'**
  String get statsConfirmedBookings;

  /// No description provided for @statsTitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statsTitle;

  /// No description provided for @statsPeriodDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get statsPeriodDaily;

  /// No description provided for @statsPeriodWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get statsPeriodWeekly;

  /// No description provided for @statsPeriodMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get statsPeriodMonthly;

  /// No description provided for @viewCalendar.
  ///
  /// In en, this message translates to:
  /// **'View calendar'**
  String get viewCalendar;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @todayDate.
  ///
  /// In en, this message translates to:
  /// **'Today {date}'**
  String todayDate(String date);

  /// No description provided for @segmentAllGuests.
  ///
  /// In en, this message translates to:
  /// **'All Guests'**
  String get segmentAllGuests;

  /// No description provided for @segmentGuestsInHall.
  ///
  /// In en, this message translates to:
  /// **'Guests in Hall'**
  String get segmentGuestsInHall;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @floor_cancel_btn.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get floor_cancel_btn;

  /// No description provided for @floor_delete_btn.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get floor_delete_btn;

  /// No description provided for @floor_edit_btn.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get floor_edit_btn;

  /// No description provided for @floor_close_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get floor_close_tooltip;

  /// No description provided for @floor_delete_table_title.
  ///
  /// In en, this message translates to:
  /// **'Delete table'**
  String get floor_delete_table_title;

  /// No description provided for @floor_confirm_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm delete'**
  String get floor_confirm_delete_title;

  /// No description provided for @floor_delete_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete'**
  String get floor_delete_error;

  /// No description provided for @floor_save_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get floor_save_error;

  /// No description provided for @floor_table_free.
  ///
  /// In en, this message translates to:
  /// **'Table free'**
  String get floor_table_free;

  /// No description provided for @floor_status_free.
  ///
  /// In en, this message translates to:
  /// **'Table free'**
  String get floor_status_free;

  /// No description provided for @floor_status_reserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get floor_status_reserved;

  /// No description provided for @floor_status_waiting.
  ///
  /// In en, this message translates to:
  /// **'Guest expected'**
  String get floor_status_waiting;

  /// No description provided for @floor_status_arrived.
  ///
  /// In en, this message translates to:
  /// **'Guest arrived'**
  String get floor_status_arrived;

  /// No description provided for @floor_status_occupied.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get floor_status_occupied;

  /// No description provided for @floor_action_reserve.
  ///
  /// In en, this message translates to:
  /// **'Reserve table'**
  String get floor_action_reserve;

  /// No description provided for @floor_action_mark_arrived.
  ///
  /// In en, this message translates to:
  /// **'Guest arrived ✓'**
  String get floor_action_mark_arrived;

  /// No description provided for @floor_action_mark_occupied.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get floor_action_mark_occupied;

  /// No description provided for @floor_action_no_show.
  ///
  /// In en, this message translates to:
  /// **'No-show'**
  String get floor_action_no_show;

  /// No description provided for @floor_action_free.
  ///
  /// In en, this message translates to:
  /// **'Free up'**
  String get floor_action_free;

  /// No description provided for @floor_action_finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get floor_action_finish;

  /// No description provided for @floor_all_zones.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get floor_all_zones;

  /// No description provided for @floor_no_tables_added.
  ///
  /// In en, this message translates to:
  /// **'No tables added yet'**
  String get floor_no_tables_added;

  /// No description provided for @floor_confirm_move_table.
  ///
  /// In en, this message translates to:
  /// **'Save table to new position?'**
  String get floor_confirm_move_table;

  /// No description provided for @floor_no_bookings_today.
  ///
  /// In en, this message translates to:
  /// **'No bookings today'**
  String get floor_no_bookings_today;

  /// No description provided for @floor_today_bookings.
  ///
  /// In en, this message translates to:
  /// **'Today\'s bookings'**
  String get floor_today_bookings;

  /// No description provided for @floor_edit_table_title.
  ///
  /// In en, this message translates to:
  /// **'Edit table'**
  String get floor_edit_table_title;

  /// No description provided for @floor_new_table_title.
  ///
  /// In en, this message translates to:
  /// **'New table'**
  String get floor_new_table_title;

  /// No description provided for @floor_table_number_label.
  ///
  /// In en, this message translates to:
  /// **'Table number'**
  String get floor_table_number_label;

  /// No description provided for @floor_capacity_label.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get floor_capacity_label;

  /// No description provided for @floor_location_label.
  ///
  /// In en, this message translates to:
  /// **'Location (optional)'**
  String get floor_location_label;

  /// No description provided for @floor_location_hint.
  ///
  /// In en, this message translates to:
  /// **'Main hall, Terrace...'**
  String get floor_location_hint;

  /// No description provided for @floor_zone_label.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get floor_zone_label;

  /// No description provided for @floor_zone_hint.
  ///
  /// In en, this message translates to:
  /// **'Select zone'**
  String get floor_zone_hint;

  /// No description provided for @floor_required_field.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get floor_required_field;

  /// No description provided for @floor_positive_number_error.
  ///
  /// In en, this message translates to:
  /// **'Enter a positive number'**
  String get floor_positive_number_error;

  /// No description provided for @floor_no_shifts.
  ///
  /// In en, this message translates to:
  /// **'No shifts'**
  String get floor_no_shifts;

  /// No description provided for @floor_edit_shift_title.
  ///
  /// In en, this message translates to:
  /// **'Edit shift'**
  String get floor_edit_shift_title;

  /// No description provided for @floor_new_shift_title.
  ///
  /// In en, this message translates to:
  /// **'Add new shift'**
  String get floor_new_shift_title;

  /// No description provided for @floor_staff_name_label.
  ///
  /// In en, this message translates to:
  /// **'Staff name'**
  String get floor_staff_name_label;

  /// No description provided for @floor_date_label.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get floor_date_label;

  /// No description provided for @floor_start_time_label.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get floor_start_time_label;

  /// No description provided for @floor_end_time_label.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get floor_end_time_label;

  /// No description provided for @floor_notes_label.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get floor_notes_label;

  /// No description provided for @floor_select_date_time.
  ///
  /// In en, this message translates to:
  /// **'Select date and time'**
  String get floor_select_date_time;

  /// No description provided for @floor_tables_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading tables...'**
  String get floor_tables_loading;

  /// No description provided for @floor_no_tables_available.
  ///
  /// In en, this message translates to:
  /// **'No tables available'**
  String get floor_no_tables_available;

  /// No description provided for @floor_tables_optional.
  ///
  /// In en, this message translates to:
  /// **'Tables (optional)'**
  String get floor_tables_optional;

  /// No description provided for @floor_restaurant_fallback.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get floor_restaurant_fallback;

  /// No description provided for @floor_filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get floor_filter_all;

  /// No description provided for @floor_filter_reservations.
  ///
  /// In en, this message translates to:
  /// **'Reservations'**
  String get floor_filter_reservations;

  /// No description provided for @floor_filter_updates.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get floor_filter_updates;

  /// No description provided for @floor_filter_cancellations.
  ///
  /// In en, this message translates to:
  /// **'Cancellations'**
  String get floor_filter_cancellations;

  /// No description provided for @floor_event_guest_label.
  ///
  /// In en, this message translates to:
  /// **'Guest:'**
  String get floor_event_guest_label;

  /// No description provided for @floor_event_table_label.
  ///
  /// In en, this message translates to:
  /// **'Table:'**
  String get floor_event_table_label;

  /// No description provided for @floor_confirm_delete_table.
  ///
  /// In en, this message translates to:
  /// **'Delete table \"{number}\"?'**
  String floor_confirm_delete_table(String number);

  /// No description provided for @floor_confirm_delete_shift.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}\'s shift?'**
  String floor_confirm_delete_shift(String name);

  /// No description provided for @floor_table_number.
  ///
  /// In en, this message translates to:
  /// **'Table {number}'**
  String floor_table_number(String number);

  /// No description provided for @floor_table_title.
  ///
  /// In en, this message translates to:
  /// **'Table {number}'**
  String floor_table_title(String number);

  /// No description provided for @floor_guests_kishi.
  ///
  /// In en, this message translates to:
  /// **'{count} guests'**
  String floor_guests_kishi(int count);

  /// No description provided for @floor_table_capacity_label.
  ///
  /// In en, this message translates to:
  /// **'{number} · {capacity} guests'**
  String floor_table_capacity_label(String number, int capacity);

  /// No description provided for @floor_reservation_number.
  ///
  /// In en, this message translates to:
  /// **'No.{number}'**
  String floor_reservation_number(String number);

  /// No description provided for @floor_event_guest_count.
  ///
  /// In en, this message translates to:
  /// **'{count} guests'**
  String floor_event_guest_count(int count);

  /// No description provided for @editBookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit booking'**
  String get editBookingTitle;

  /// No description provided for @bookingTimeRange.
  ///
  /// In en, this message translates to:
  /// **'Time range'**
  String get bookingTimeRange;

  /// No description provided for @bookingStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get bookingStartLabel;

  /// No description provided for @bookingEndLabel.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get bookingEndLabel;

  /// No description provided for @bookingTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Booking type'**
  String get bookingTypeLabel;

  /// No description provided for @tableLabel.
  ///
  /// In en, this message translates to:
  /// **'Table'**
  String get tableLabel;

  /// No description provided for @bookingNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get bookingNotesLabel;

  /// No description provided for @bookingNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Additional info (optional)'**
  String get bookingNotesHint;

  /// No description provided for @updateBtn.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateBtn;

  /// No description provided for @enterGuestNameError.
  ///
  /// In en, this message translates to:
  /// **'Enter guest name'**
  String get enterGuestNameError;

  /// No description provided for @selectTable.
  ///
  /// In en, this message translates to:
  /// **'Select a table'**
  String get selectTable;

  /// No description provided for @banquetEndTimeError.
  ///
  /// In en, this message translates to:
  /// **'Select an end time for the banquet'**
  String get banquetEndTimeError;

  /// No description provided for @bookingPastTimeError.
  ///
  /// In en, this message translates to:
  /// **'Cannot book a table for a time that has already passed'**
  String get bookingPastTimeError;

  /// No description provided for @bookingUpdated.
  ///
  /// In en, this message translates to:
  /// **'Booking updated'**
  String get bookingUpdated;

  /// No description provided for @bookingCreated.
  ///
  /// In en, this message translates to:
  /// **'Booking added'**
  String get bookingCreated;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get genericError;

  /// No description provided for @tablesLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tables'**
  String get tablesLoadError;

  /// No description provided for @tableBusy.
  ///
  /// In en, this message translates to:
  /// **'This table is busy'**
  String get tableBusy;

  /// No description provided for @tableBusyInRange.
  ///
  /// In en, this message translates to:
  /// **'This table is busy during {range}'**
  String tableBusyInRange(String range);

  /// No description provided for @tableAlreadyBookedInRange.
  ///
  /// In en, this message translates to:
  /// **'Table {number} is already booked during {range}'**
  String tableAlreadyBookedInRange(String number, String range);

  /// No description provided for @tableBookedForSlot.
  ///
  /// In en, this message translates to:
  /// **'A table is already booked for this time slot ({range})'**
  String tableBookedForSlot(String range);

  /// No description provided for @bookingTableOption.
  ///
  /// In en, this message translates to:
  /// **'{number} ({capacity} guests)'**
  String bookingTableOption(String number, int capacity);

  /// No description provided for @tableBusyLabel.
  ///
  /// In en, this message translates to:
  /// **'Busy: {range}'**
  String tableBusyLabel(String range);

  /// No description provided for @zonesSaveError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save zones'**
  String get zonesSaveError;

  /// No description provided for @zoneManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Zone management'**
  String get zoneManagementTitle;

  /// No description provided for @zoneManagementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For example: Main hall, Terrace, VIP.'**
  String get zoneManagementSubtitle;

  /// No description provided for @zoneNameHint.
  ///
  /// In en, this message translates to:
  /// **'Zone name (e.g. Terrace)'**
  String get zoneNameHint;

  /// No description provided for @noZonesYet.
  ///
  /// In en, this message translates to:
  /// **'No zones added yet'**
  String get noZonesYet;

  /// No description provided for @bookingStatus_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Waiting for guest'**
  String get bookingStatus_confirmed;

  /// No description provided for @bookingStatus_arrived.
  ///
  /// In en, this message translates to:
  /// **'Guest arrived'**
  String get bookingStatus_arrived;

  /// No description provided for @bookingStatus_noShow.
  ///
  /// In en, this message translates to:
  /// **'No-show'**
  String get bookingStatus_noShow;

  /// No description provided for @bookingStatus_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get bookingStatus_completed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
