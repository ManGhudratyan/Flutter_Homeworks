import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences preferences;
  const PreferenceService(this.preferences);

  Future<void> setUsername(String username) async {
    await preferences.setString('username', username);
  }

  String? getUsername() {
    return preferences.getString('username');
  }

  Future<void> setPassword(String password) async {
    await preferences.setString('password', password);
  }

  String? getPassword() {
    return preferences.getString('password');
  }

  Future<void> setFullName(String fullName) async {
    await preferences.setString('fullName', fullName);
  }

  String? getFullName() {
    return preferences.getString('fullName');
  }

  Future<void> setEmail(String email) async {
    await preferences.setString('email', email);
  }

  String? getEmail() {
    return preferences.getString('email');
  }

  void clearPreferences() {
    preferences.clear();
  }
}
