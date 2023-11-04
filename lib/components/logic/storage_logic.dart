import 'package:shared_preferences/shared_preferences.dart';

class StorageLogic {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  // StorageLogic() {
  //   initData();
  // }

  Future<void> initData() async {}

  Future<bool> saveData(
      {required String key,
      required dynamic value,
      required Type? type}) async {
    try {
      final SharedPreferences storage = await _storage;
      switch (type) {
        case String:
          await storage.setString(key, value);
          return true;
        case int:
          await storage.setInt(key, value);
          return true;
        case double:
          await storage.setDouble(key, value);
          return true;
        case bool:
          await storage.setBool(key, value);
          return true;
        default:
          await storage.setString(key, value);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> getData({required String key, Type? type}) async {
    final SharedPreferences storage = await _storage;
    switch (type) {
      case String:
        return storage.getString(key);
      case int:
        return storage.getInt(key);
      case double:
        return storage.getDouble(key);
      case bool:
        return storage.getBool(key);
      default:
        return storage.getString(key);
    }
  }

  Future<void> removeData({required String key}) async {
    final SharedPreferences storage = await _storage;
    await storage.remove(key);
  }
}
