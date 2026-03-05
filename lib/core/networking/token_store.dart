/// Abstraction for token persistence.
///
/// Implementations may store tokens in secure storage, shared prefs, etc.
/// The [InMemoryTokenStore] is a simple default used during development.
abstract class TokenStore {
  /// Retrieve the current access token, or `null` if none exists.
  Future<String?> getAccessToken();

  /// Retrieve the current refresh token, or `null` if none exists.
  Future<String?> getRefreshToken();

  /// Persist new tokens.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  /// Clear all stored tokens (e.g. on logout).
  Future<void> clearTokens();
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
}
