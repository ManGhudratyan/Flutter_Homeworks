import 'package:flutter/material.dart';
import 'package:state_managment/state/user_state.dart';

import '../button.dart';
import '../db/preferences_service.dart';
import '../textform.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    this.preferenceService,
  });
  final PreferenceService? preferenceService;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserState? userState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userState = UserState.of(context);
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
                      initialValue: UserState.of(context)?.username ?? '',
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
                      initialValue: UserState.of(context)?.email ?? '',
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
                      initialValue: UserState.of(context)?.phoneNumber ?? '',
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
                      initialValue: UserState.of(context)?.password ?? '',
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
    userState?.getUsername();
    userState?.getEmail();
    userState?.getPassword();
    userState?.getPhoneNumber();

    if (userState?.username != _usernameController.text ||
        userState?.email != _emailController.text ||
        userState?.phoneNumber != _phoneNumberController.text ||
        userState?.password != _passwordController.text) {
      userState?.setUsername(_usernameController.text);
      userState?.setEmail(_emailController.text);
      userState?.setPhoneNumber(_phoneNumberController.text);
      userState?.setPassword(_passwordController.text);
    }
    Navigator.pop(context, '/profile');
  }
}
