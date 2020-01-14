import 'package:shared_preferences/shared_preferences.dart';

Future<bool> savePrefs(String key, String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setString(key, value);
}

Future<bool> savePrefsInt(String key, int value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setInt(key, value);
}

Future<bool> savePrefsbool(String key, bool value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setBool(key, value);
}

Future<String> getpreferences(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String value = preferences.getString(key);
  return value;
}

Future<int> getpreferencesInt(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int value = preferences.getInt(key);
  return value;
}

Future<bool> getpreferencesbool(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool value =
      preferences.getBool(key) != null ? preferences.getBool(key) : false;
  return value;
}

Future<bool> clearPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.clear();
}
