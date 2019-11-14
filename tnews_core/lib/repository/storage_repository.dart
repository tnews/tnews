part of t_core.repository;

abstract class StorageRepository {
  String getToken();
  Future<bool> saveToken(String value);
}

/// Key get value
abstract class _StorageKeys {
  static const String token = 'token_user';
}

class StorageRepositoryImpl extends StorageRepository {
  final SharedPreferences shared;

  StorageRepositoryImpl(this.shared);

  @override
  String getToken() {
    return shared.getString(_StorageKeys.token);
  }

  @override
  Future<bool> saveToken(String value) {
    return shared.setString(_StorageKeys.token, value);
  }
}
