import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static Future<void> saveData({
    required String email,
    required String name,
    required String birthday,
    required String gender,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('name', name);
    prefs.setString('birthday', birthday);
    prefs.setString('gender', gender);
  }

  static Future<Map<String, String>> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email') ?? '',
      'name': prefs.getString('name') ?? '',
      'birthday': prefs.getString('birthday') ?? '',
      'gender': prefs.getString('gender') ?? '',
    };
  }
}
