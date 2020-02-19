import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> saveInt(String key, int value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<bool> saveString(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> saveDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, value);
  }

  static dynamic get(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<bool> remove(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
