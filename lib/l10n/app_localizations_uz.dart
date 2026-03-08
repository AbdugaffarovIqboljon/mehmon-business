// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appName => 'MEHMON';

  @override
  String get continueBtn => 'Davom etish';

  @override
  String get languageUz => 'O\'zbekcha';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageEn => 'English';

  @override
  String get introTitle => 'Zalni boshqarish\nbitta ekranda';

  @override
  String get introSubtitle =>
      'Stollar holati, tashriflar - barchasi\nnazorat ostida.';

  @override
  String get loginTitle => 'Tizimga kirish';

  @override
  String get nameLabel => 'Ismingiz';

  @override
  String get nameHint => 'Ismingizni kiriting';

  @override
  String get nameValidationError => 'Ismingizni kiriting';

  @override
  String get phoneLabel => 'Telefon raqamingiz';

  @override
  String get phoneHint => '+998 93 123 45 67';

  @override
  String get phoneValidationError => 'Telefon raqamingizni kiriting';

  @override
  String get phoneInvalidError => 'Telefon raqamni to\'liq kiriting';

  @override
  String get loginBtn => 'Kirish';

  @override
  String get registerLink => 'Ro\'yxatdan o\'tish';

  @override
  String get newToApp => 'Akkaunt yo\'qmi?';

  @override
  String get registerTitle => 'Ro\'yxatdan o\'tish';

  @override
  String get restaurantLabel => 'Kafe/Restoran nomi';

  @override
  String get restaurantHint => 'Nomini kiriting';

  @override
  String get restaurantValidationError => 'Nomini kiriting';

  @override
  String get alreadyHaveAccount => 'Akkauntingiz bormi?';

  @override
  String get loginLink => 'Tizimga kirish';

  @override
  String get profileSetupTitle => 'Restoran profilini to\'ldiring';

  @override
  String get photoPlaceholder => 'Restoran rasmini yuklang';

  @override
  String get restaurantTypeHint => 'Muassasa turini tanlang';

  @override
  String get addressLabel => 'Manzil';

  @override
  String get addressHint => 'Manzilni kiriting';

  @override
  String get workingHoursLabel => 'Ish vaqti';

  @override
  String get openTimeHint => 'Ochilish vaqti';

  @override
  String get closeTimeHint => 'Yopilish vaqti';

  @override
  String get profileRegisterBtn => 'Ro\'yxatdan o\'tish';

  @override
  String get photoPickerError => 'Galereyani ochib bo\'lmadi';

  @override
  String get restTypeCafe => 'Kafe';

  @override
  String get restTypeRestaurant => 'Restoran';

  @override
  String get restTypeFastfood => 'Fastfud';

  @override
  String get restTypeChayhana => 'Choyxona';

  @override
  String get tabFloor => 'Zal';

  @override
  String get tabBookings => 'Band qilingan';

  @override
  String get tabGuests => 'Mehmonlar';

  @override
  String get tabProfile => 'Profil';

  @override
  String get profileSubtitle => 'Akkount va ilova sozlamalarini boshqaring';

  @override
  String get profileEditProfile => 'Profilni tahrirlash';

  @override
  String get profileChangeLanguage => 'Tilni o\'zgartirish';

  @override
  String get profileAboutUs => 'Biz haqimizda';

  @override
  String get profileAboutDescription =>
      'MEHMON restoran jamoalariga zal, bronlar va mehmonlarni bitta ilovada boshqarishga yordam beradi.';

  @override
  String get profileVersionLabel => 'Versiya';

  @override
  String get profileCompanyInfo => 'MEHMON jamoasi';

  @override
  String get saveBtn => 'Saqlash';

  @override
  String get monthJan => 'Yan';

  @override
  String get monthFeb => 'Fev';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'Iyun';

  @override
  String get monthJul => 'Iyul';

  @override
  String get monthAug => 'Avg';

  @override
  String get monthSep => 'Sen';

  @override
  String get monthOct => 'Okt';

  @override
  String get monthNov => 'Noy';

  @override
  String get monthDec => 'Dek';

  @override
  String get monthJanuary => 'Yanvar';

  @override
  String get monthFebruary => 'Fevral';

  @override
  String get monthMarch => 'Mart';

  @override
  String get monthApril => 'Aprel';

  @override
  String get monthMayLong => 'May';

  @override
  String get monthJune => 'Iyun';

  @override
  String get monthJuly => 'Iyul';

  @override
  String get monthAugust => 'Avgust';

  @override
  String get monthSeptember => 'Sentabr';

  @override
  String get monthOctober => 'Oktabr';

  @override
  String get monthNovember => 'Noyabr';

  @override
  String get monthDecember => 'Dekabr';

  @override
  String get weekdayMon => 'Du';

  @override
  String get weekdayTue => 'Se';

  @override
  String get weekdayWed => 'Ch';

  @override
  String get weekdayThu => 'Pa';

  @override
  String get weekdayFri => 'Ju';

  @override
  String get weekdaySat => 'Sha';

  @override
  String get weekdaySun => 'Yak';

  @override
  String get bookATable => 'Stol band qilish';

  @override
  String get guestsLabel => 'Mehmonlar';

  @override
  String get selectTime => 'Vaqtni tanlang';

  @override
  String get guestNameLabel => 'Mehmon ismi';

  @override
  String get banquet => 'Banket';

  @override
  String guestsCount(Object count) {
    return '$count ta mehmon';
  }

  @override
  String noBookingsOn(Object day, Object month) {
    return '$day $month da bronlar yo\'q';
  }

  @override
  String get addBookingHint => '+ tugmasi orqali yangi bron qo\'shing';

  @override
  String get failedToLoadBookings => 'Bronlarni yuklab bo\'lmadi';

  @override
  String get retryBtn => 'Qayta urinish';

  @override
  String get todayLabel => 'Bugun';

  @override
  String get expectedGuests => 'Kutilayotgan mehmonlar soni';

  @override
  String get guestsInHall => 'Zaldagi mehmonlar';

  @override
  String get bookingsLabel => 'Bronlar';

  @override
  String get supportComingSoon =>
      'Qo\'llab-quvvatlash tez orada mavjud bo\'ladi';

  @override
  String get logOutImplNextStep =>
      'Chiqish keyingi bosqichda amalga oshiriladi';

  @override
  String get chronologyTitle => 'Xronologiya';

  @override
  String get noActivityYet => 'Hozircha faollik yo\'q';

  @override
  String inDevelopment(Object title) {
    return '$title ishlab chiqilmoqda';
  }

  @override
  String get guestTrafficTitle => 'Mehmonlar oqimi';

  @override
  String get hallOccupancyTitle => 'Zal bandligi';

  @override
  String get drawerOpsGroup => 'Operatsiyalar';

  @override
  String get drawerStaffGroup => 'Xodimlar va integratsiyalar';

  @override
  String get drawerDashboard => 'Asosiy panel';

  @override
  String get drawerChronology => 'Xronologiya';

  @override
  String get drawerReports => 'Hisobotlar';

  @override
  String get drawerShifts => 'Smenalar';

  @override
  String get drawerPosIntegration => 'POS-integratsiya';

  @override
  String get drawerSettings => 'Sozlamalar';

  @override
  String get guestsEmptyInHallTitle => 'Hozir zalda mehmonlar yo\'q';

  @override
  String get guestsEmptyInHallSubtitle =>
      'Mehmonlar zalga kelgach, shu yerda ko\'rinadi.';

  @override
  String get guestsEmptyAllTitle => 'Mehmonlar ro\'yxati hozircha bo\'sh';

  @override
  String get guestsEmptyAllSubtitle =>
      'Tarix va eslatmalarni ko\'rish uchun mehmonlarni qo\'shing.';

  @override
  String get failedToLoadGuests => 'Mehmonlarni yuklab bo\'lmadi';

  @override
  String get backBtn => 'Orqaga';

  @override
  String get guestInfoTitle => 'Mehmon haqida ma\'lumot';

  @override
  String get vipGuest => 'VIP Mehmon';

  @override
  String get regularGuest => 'Mehmon';

  @override
  String get noContactInfo => 'Aloqa ma\'lumotlari kiritilmagan';

  @override
  String get visitHistoryTitle => 'Tashriflar tarixi';

  @override
  String get noVisitHistory => 'Tashriflar tarixi hozircha yo\'q.';

  @override
  String get notesTitle => 'Eslatmalar';

  @override
  String get noNotes => 'Hozircha eslatmalar yo\'q.';

  @override
  String get guestNotFound => 'Mehmon topilmadi';

  @override
  String statsError(String error) {
    return 'Xato: $error';
  }

  @override
  String get statsTotalBookings => 'Jami band qilishlar';

  @override
  String get statsTotalGuests => 'Jami mehmonlar';

  @override
  String get statsOccupancyRate => 'Bandlik darajasi';

  @override
  String get statsRevenue => 'Tushum';

  @override
  String get statsTitle => 'Statistika';

  @override
  String get statsPeriodDaily => 'Kunlik';

  @override
  String get statsPeriodWeekly => 'Haftalik';

  @override
  String get statsPeriodMonthly => 'Oylik';

  @override
  String get viewCalendar => 'Kalendarni ko\'rish';

  @override
  String get collapse => 'Yopish';

  @override
  String todayDate(String date) {
    return 'Bugun $date';
  }

  @override
  String get segmentAllGuests => 'Barcha mehmonlar';

  @override
  String get segmentGuestsInHall => 'Zaldagi mehmonlar';

  @override
  String get logout => 'Chiqish';

  @override
  String get support => 'Qo\'llab-quvvatlash';
}
