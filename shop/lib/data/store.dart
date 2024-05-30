import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<void> saveString(String key, String Value) async {
    final prefs = await SharedPreferences.getInstance();
  }
}
