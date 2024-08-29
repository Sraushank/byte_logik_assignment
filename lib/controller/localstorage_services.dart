import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveUserSession(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
  }

  static Future<String?> getUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  static Future<void> clearUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userEmail');
  }
}
