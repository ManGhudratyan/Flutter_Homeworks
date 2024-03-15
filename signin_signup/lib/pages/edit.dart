import 'package:flutter/material.dart';
import 'package:signin_signup/db/preferences_service.dart';
import 'package:signin_signup/widgets/button.dart';
import 'package:signin_signup/widgets/textform.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {super.key,
      this.preferenceService,
      this.username,
      this.phoneNumber,
      this.email,
      this.password});
  final PreferenceService? preferenceService;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? password;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Column(
                children: [
                  SizedBox(
                    width: 142,
                    height: 142,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/manimage.jpeg'),
                    ),
                  ),
                  Text(
                    'Change picture',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormWidget(
                      controller: _usernameController,
                      initialValue: widget.username,
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormWidget(
                      controller: _emailController,
                      initialValue: widget.email,
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormWidget(
                      controller: _phoneNumberController,
                      initialValue: widget.phoneNumber,
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormWidget(
                      controller: _passwordController,
                      initialValue: widget.password,
                    ),
                    const SizedBox(height: 50),
                    ButtonWidget(
                        onTap: _updatePage,
                        _globalKey,
                        'Update',
                        283,
                        55,
                        const Color.fromRGBO(32, 195, 175, 1),
                        Colors.white)
                  ],
                ),
              )
              // TextFormWidget()
            ],
          ),
        ),
      ),
    );
  }

  void _updatePage() {
    final String? username = widget.preferenceService?.getUsername();
    final String? email = widget.preferenceService?.getEmail();
    final String? phoneNumber = widget.preferenceService?.getPhoneNumber();
    final String? password = widget.preferenceService?.getPassword();

    if (username != _usernameController.text ||
        email != _emailController.text ||
        phoneNumber != _phoneNumberController.text ||
        password != _passwordController.text) {
      widget.preferenceService?.setUsername('username');
      widget.preferenceService?.setEmail('email');
      widget.preferenceService?.setPhoneNumber('phone-number');
      widget.preferenceService?.setPassword('password');
    }
    Navigator.pushNamed(context, '/profile');
  }
}
