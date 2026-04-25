import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstraction for token persistence.
///
/// Implementations may store tokens in secure storage, shared prefs, etc.
/// The [InMemoryTokenStore] is a simple default used during development.
abstract class TokenStore {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> clearTokens();

  Future<bool> get hasToken async => (await getAccessToken()) != null;
}

/// In-memory implementation suitable for development and testing.
class InMemoryTokenStore implements TokenStore {
  String? _accessToken;
  String? _refreshToken;

  @override
  Future<String?> getAccessToken() async => _accessToken;

  @override
  Future<String?> getRefreshToken() async => _refreshToken;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
  }

  @override
  Future<bool> get hasToken async => (await getAccessToken()) != null;
}

/// SharedPreferences-backed implementation for production use.
class SharedPrefsTokenStore implements TokenStore {
  SharedPrefsTokenStore(this._prefs);

  final SharedPreferences _prefs;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  @override
  Future<String?> getAccessToken() async => _prefs.getString(_accessTokenKey);

  @override
  Future<String?> getRefreshToken() async => _prefs.getString(_refreshTokenKey);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _prefs.setString(_accessTokenKey, accessToken),
      _prefs.setString(_refreshTokenKey, refreshToken),
    ]);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([
      _prefs.remove(_accessTokenKey),
      _prefs.remove(_refreshTokenKey),
    ]);
  }

  @override
  Future<bool> get hasToken async => (await getAccessToken()) != null;
}

final tokenStoreProvider = Provider<TokenStore>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPrefsTokenStore(prefs);
});
