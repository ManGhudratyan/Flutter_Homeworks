import 'package:flutter/material.dart';
import 'package:state_managment/db/preferences_service.dart';

class UserStateWidget extends StatefulWidget {
  const UserStateWidget({
    required this.child,
    required this.preferenceService,
    super.key,
  });

  final Widget child;
  final PreferenceService preferenceService;

  @override
  State<UserStateWidget> createState() => _UserStateWidgetState();
}

class _UserStateWidgetState extends State<UserStateWidget> {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  void getUsername() => setState(() {
        username = widget.preferenceService.getUsername() ?? '';
      });

  Future<void> setUsername(String username) async {
    await widget.preferenceService.setUsername(username);
    setState(() {
      this.username = username;
    });
  }

  void getEmail() => setState(() {
        email = widget.preferenceService.getEmail() ?? '';
      });

  Future<void> setEmail(String email) async {
    await widget.preferenceService.setEmail(email);
    setState(() {
      this.email = email;
    });
  }

  void getPhoneNumber() => setState(() {
        phoneNumber = widget.preferenceService.getPhoneNumber() ?? '';
      });

  Future<void> setPhoneNumber(String phoneNumber) async {
    await widget.preferenceService.setPhoneNumber(phoneNumber);
    setState(() {
      this.phoneNumber = phoneNumber;
    });
  }

  String getPassword() => widget.preferenceService.getPassword() ?? '';

  Future<void> setPassword(String password) async {
    await widget.preferenceService.setPassword(password);
    setState(() {
      this.password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserState(
      password: password,
      getPassword: getPassword,
      setPassword: setPassword,
      username: username,
      getUsername: getUsername,
      setUsername: setUsername,
      email: email,
      getEmail: getEmail,
      setEmail: setEmail,
      phoneNumber: phoneNumber,
      getPhoneNumber: getPhoneNumber,
      setPhoneNumber: setPhoneNumber,
      child: widget.child,
    );
  }
}

class UserState extends InheritedWidget {
  const UserState(
      {required super.child,
      required this.password,
      required this.getUsername,
      required this.getPassword,
      required this.setPassword,
      required this.username,
      required this.setUsername,
      required this.email,
      required this.getEmail,
      required this.setEmail,
      required this.phoneNumber,
      required this.getPhoneNumber,
      required this.setPhoneNumber,
      super.key});

  final String password;
  final void Function() getPassword;
  final Future<void> Function(String) setPassword;
  final String username;
  final void Function() getUsername;
  final Future<void> Function(String) setUsername;
  final String email;
  final void Function() getEmail;
  final Future<void> Function(String) setEmail;
  final String phoneNumber;
  final void Function() getPhoneNumber;
  final Future<void> Function(String) setPhoneNumber;

  static UserState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserState>();

  @override
  bool updateShouldNotify(covariant UserState oldWidget) {
    return username != oldWidget.username ||
        email != oldWidget.email ||
        phoneNumber != oldWidget.phoneNumber;
  }
}
