import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kStoredUser = 'stored_user';
const kHasSelectedLanguage = 'has_selected_language';
const kHasSeenOnboarding = 'has_seen_onboarding';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize this with ProviderScope in main.dart');
});
