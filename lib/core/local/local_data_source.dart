/// Abstract interface for local data persistence.
///
/// Implementations may use Drift, Hive, SharedPreferences, etc.
/// For now, [InMemoryLocalDataSource] is provided as a placeholder.
abstract class LocalDataSource {
  /// Store a value by key.
  Future<void> put(String key, Object value);

  /// Retrieve a value by key, or `null` if not found.
  Future<Object?> get(String key);

  /// Remove a value by key.
  Future<void> remove(String key);

  /// Clear all stored data.
  Future<void> clear();
}

/// In-memory implementation for development and testing.
///
/// This will be replaced by a Drift-backed implementation once the
/// database schema is finalized.
class InMemoryLocalDataSource implements LocalDataSource {
  final Map<String, Object> _store = {};

  @override
  Future<void> put(String key, Object value) async {
    _store[key] = value;
  }

  @override
  Future<Object?> get(String key) async => _store[key];

  @override
  Future<void> remove(String key) async {
    _store.remove(key);
  }

  @override
  Future<void> clear() async {
    _store.clear();
  }
}
