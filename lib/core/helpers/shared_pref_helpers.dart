import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {

  SharedPrefHelper._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---------- SET ----------
  static Future<void> setData(String key, dynamic value) async {

    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }

  // ---------- GET (SYNC) ----------

  static String? getString(String key) => _prefs.getString(key);

  static int getInt(String key) => _prefs.getInt(key) ?? 0;

  static double getDouble(String key) => _prefs.getDouble(key) ?? 0.0;

  static bool getBool(String key) => _prefs.getBool(key) ?? false;

  // ---------- REMOVE ----------

  static Future<void> removeData(String key) async =>
      _prefs.remove(key);

  static Future<void> clearAllData() async =>
      _prefs.clear();
}

