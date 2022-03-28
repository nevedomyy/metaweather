import 'package:shared_preferences/shared_preferences.dart';

/// https://pub.dev/packages/shared_preferences

abstract class AppStorage {
  Future<String> getData(String key);
  Future<void> putData(String key, String value);
  Future<void> removeData(String key);
  Future<void> removeAll();
}

class AppStorageImpl implements AppStorage {
  final SharedPreferences prefs;

  const AppStorageImpl({required this.prefs});

  @override
  Future<String> getData(String key) async {
    return prefs.getString(key) ?? '';
  }

  @override
  Future<void> putData(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  Future<void> removeData(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> removeAll() async {
    await prefs.clear();
  }
}
