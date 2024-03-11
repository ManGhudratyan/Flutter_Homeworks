import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences preferences;
  const PreferenceService(this.preferences);

  Future<void> setEmail(String email) async {
    await preferences.setString('email', email);
  }

  String? getEmail() {
    return preferences.getString('email');
  }

  Future<void> setPassword(String password) async {
    await preferences.setString('password', password);
  }

  String? getPassword() {
    return preferences.getString('password');
  }

  Future<void> setUsername(String username) async {
    await preferences.setString('username', username);
  }

  String? getUsername() {
    return preferences.getString('username');
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    await preferences.setString('phoneNumber', phoneNumber);
  }

  String? getPhoneNumber() {
    return preferences.getString('phoneNumber');
  }
}
