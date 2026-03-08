// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'MEHMON';

  @override
  String get continueBtn => 'Продолжить';

  @override
  String get languageUz => 'O\'zbekcha';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageEn => 'English';

  @override
  String get introTitle => 'Управление залом\nв одном экране';

  @override
  String get introSubtitle => 'Статусы столов, визиты - всё\nпод контролем.';

  @override
  String get loginTitle => 'Войти';

  @override
  String get nameLabel => 'Ваше имя';

  @override
  String get nameHint => 'Введите имя';

  @override
  String get nameValidationError => 'Введите имя';

  @override
  String get phoneLabel => 'Номер телефона';

  @override
  String get phoneHint => '+998 93 123 45 67';

  @override
  String get phoneValidationError => 'Введите номер телефона';

  @override
  String get phoneInvalidError => 'Введите номер телефона полностью';

  @override
  String get loginBtn => 'Войти';

  @override
  String get registerLink => 'Зарегистрироваться';

  @override
  String get newToApp => 'Нет аккаунта?';

  @override
  String get registerTitle => 'Регистрация';

  @override
  String get restaurantLabel => 'Название кафе/ресторана';

  @override
  String get restaurantHint => 'Введите название';

  @override
  String get restaurantValidationError => 'Введите название';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get loginLink => 'Войти';

  @override
  String get profileSetupTitle => 'Заполните профиль ресторана';

  @override
  String get photoPlaceholder => 'Загрузите фото ресторана';

  @override
  String get restaurantTypeHint => 'Выберите тип заведения';

  @override
  String get addressLabel => 'Адрес';

  @override
  String get addressHint => 'Введите адрес';

  @override
  String get workingHoursLabel => 'Время работы';

  @override
  String get openTimeHint => 'Время открытия';

  @override
  String get closeTimeHint => 'Время закрытия';

  @override
  String get profileRegisterBtn => 'Зарегистрироваться';

  @override
  String get photoPickerError => 'Не удалось открыть галерею';

  @override
  String get restTypeCafe => 'Кафе';

  @override
  String get restTypeRestaurant => 'Ресторан';

  @override
  String get restTypeFastfood => 'Фастфуд';

  @override
  String get restTypeChayhana => 'Чайхана';

  @override
  String get tabFloor => 'Зал';

  @override
  String get tabBookings => 'Брони';

  @override
  String get tabGuests => 'Гости';

  @override
  String get tabProfile => 'Профиль';

  @override
  String get profileSubtitle => 'Управляйте аккаунтом и настройками приложения';

  @override
  String get profileEditProfile => 'Редактировать профиль';

  @override
  String get profileChangeLanguage => 'Сменить язык';

  @override
  String get profileAboutUs => 'О нас';

  @override
  String get profileAboutDescription =>
      'MEHMON помогает ресторанным командам управлять залом, бронями и гостями в одном приложении.';

  @override
  String get profileVersionLabel => 'Версия';

  @override
  String get profileCompanyInfo => 'Команда MEHMON';

  @override
  String get saveBtn => 'Сохранить';

  @override
  String get monthJan => 'Янв';

  @override
  String get monthFeb => 'Фев';

  @override
  String get monthMar => 'Мар';

  @override
  String get monthApr => 'Апр';

  @override
  String get monthMay => 'Май';

  @override
  String get monthJun => 'Июн';

  @override
  String get monthJul => 'Июл';

  @override
  String get monthAug => 'Авг';

  @override
  String get monthSep => 'Сен';

  @override
  String get monthOct => 'Окт';

  @override
  String get monthNov => 'Ноя';

  @override
  String get monthDec => 'Дек';

  @override
  String get monthJanuary => 'Январь';

  @override
  String get monthFebruary => 'Февраль';

  @override
  String get monthMarch => 'Март';

  @override
  String get monthApril => 'Апрель';

  @override
  String get monthMayLong => 'Май';

  @override
  String get monthJune => 'Июнь';

  @override
  String get monthJuly => 'Июль';

  @override
  String get monthAugust => 'Август';

  @override
  String get monthSeptember => 'Сентябрь';

  @override
  String get monthOctober => 'Октябрь';

  @override
  String get monthNovember => 'Ноябрь';

  @override
  String get monthDecember => 'Декабрь';

  @override
  String get weekdayMon => 'Пн';

  @override
  String get weekdayTue => 'Вт';

  @override
  String get weekdayWed => 'Ср';

  @override
  String get weekdayThu => 'Чт';

  @override
  String get weekdayFri => 'Пт';

  @override
  String get weekdaySat => 'Сб';

  @override
  String get weekdaySun => 'Вс';

  @override
  String get bookATable => 'Забронировать стол';

  @override
  String get guestsLabel => 'Гости';

  @override
  String get selectTime => 'Выберите время';

  @override
  String get guestNameLabel => 'Имя гостя';

  @override
  String get banquet => 'Банкет';

  @override
  String guestsCount(Object count) {
    return '$count гостей';
  }

  @override
  String noBookingsOn(Object day, Object month) {
    return 'Нет броней на $day $month';
  }

  @override
  String get addBookingHint => 'Добавьте новую бронь через кнопку +';

  @override
  String get failedToLoadBookings => 'Не удалось загрузить брони';

  @override
  String get retryBtn => 'Повторить';

  @override
  String get todayLabel => 'Сегодня';

  @override
  String get expectedGuests => 'Ожидаемое количество гостей';

  @override
  String get guestsInHall => 'Гости в зале';

  @override
  String get bookingsLabel => 'Брони';

  @override
  String get supportComingSoon => 'Поддержка скоро будет доступна';

  @override
  String get logOutImplNextStep => 'Выход будет реализован на следующем шаге';

  @override
  String get chronologyTitle => 'Хронология';

  @override
  String get noActivityYet => 'Активности пока нет';

  @override
  String inDevelopment(Object title) {
    return '$title в разработке';
  }

  @override
  String get guestTrafficTitle => 'Поток гостей';

  @override
  String get hallOccupancyTitle => 'Занятость зала';

  @override
  String get drawerOpsGroup => 'Операции';

  @override
  String get drawerStaffGroup => 'Персонал и интеграции';

  @override
  String get drawerDashboard => 'Дашборд';

  @override
  String get drawerChronology => 'Хронология';

  @override
  String get drawerReports => 'Отчёты';

  @override
  String get drawerShifts => 'Смены';

  @override
  String get drawerPosIntegration => 'POS-интеграция';

  @override
  String get drawerSettings => 'Настройки';

  @override
  String get guestsEmptyInHallTitle => 'Сейчас в зале нет гостей';

  @override
  String get guestsEmptyInHallSubtitle =>
      'Когда гости появятся в зале, они отобразятся здесь.';

  @override
  String get guestsEmptyAllTitle => 'Список гостей пока пуст';

  @override
  String get guestsEmptyAllSubtitle =>
      'Добавьте гостей, чтобы видеть историю и заметки.';

  @override
  String get failedToLoadGuests => 'Не удалось загрузить гостей';

  @override
  String get backBtn => 'Назад';

  @override
  String get guestInfoTitle => 'Информация о госте';

  @override
  String get vipGuest => 'VIP Гость';

  @override
  String get regularGuest => 'Гость';

  @override
  String get noContactInfo => 'Контактные данные не указаны';

  @override
  String get visitHistoryTitle => 'История посещений';

  @override
  String get noVisitHistory => 'История посещений пока отсутствует.';

  @override
  String get notesTitle => 'Заметки';

  @override
  String get noNotes => 'Заметок пока нет.';

  @override
  String get guestNotFound => 'Гость не найден';

  @override
  String statsError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get statsTotalBookings => 'Всего бронирований';

  @override
  String get statsTotalGuests => 'Всего гостей';

  @override
  String get statsOccupancyRate => 'Заполняемость';

  @override
  String get statsRevenue => 'Выручка';

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsPeriodDaily => 'За день';

  @override
  String get statsPeriodWeekly => 'За неделю';

  @override
  String get statsPeriodMonthly => 'За месяц';

  @override
  String get viewCalendar => 'Открыть календарь';

  @override
  String get collapse => 'Свернуть';

  @override
  String todayDate(String date) {
    return 'Сегодня $date';
  }

  @override
  String get segmentAllGuests => 'Все гости';

  @override
  String get segmentGuestsInHall => 'Гости в зале';

  @override
  String get logout => 'Выйти';

  @override
  String get support => 'Поддержка';
}
