part of t_core.service;

abstract class StorageService {
  String getToken();
  Future<bool> saveToken(String value);
}

class StorageServiceImpl implements StorageService {
  final StorageRepository repository;

  StorageServiceImpl(this.repository);

  @override
  String getToken() {
    return repository.getToken();
  }

  @override
  Future<bool> saveToken(String value) {
    return repository.saveToken(value);
  }
}
