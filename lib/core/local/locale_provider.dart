import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';

const _kLocalePrefsKey = 'locale_prefs_key';

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(() {
  return LocaleNotifier();
});

class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedCode = prefs.getString(_kLocalePrefsKey);
    if (savedCode != null && savedCode.isNotEmpty) {
      return Locale(savedCode);
    }
    return const Locale('uz'); // Default to Uzbek
  }

  Future<void> setLocale(String languageCode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_kLocalePrefsKey, languageCode);
    state = Locale(languageCode);
  }
}
