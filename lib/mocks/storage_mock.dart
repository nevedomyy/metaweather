import 'package:metaweather/core/services/storage.dart';

class AppStorageMock implements AppStorage {
  Map<String, String> storage = {};

  @override
  Future<String> getData(String key) async {
    return storage[key] ?? '';
  }

  @override
  Future<void> putData(String key, String value) async {
    storage[key] = value;
  }

  @override
  Future<void> removeData(String key) async {
    storage.remove(key);
  }

  @override
  Future<void> removeAll() async {
    storage.clear();
  }
}
