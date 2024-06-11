// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';
import '../../constants/assets.dart';
import '../../constants/gaps.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/general/text_field_profile.dart';
import '../main/main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.userModel});
  final UserEntity? userModel;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _usernameController =
      TextEditingController(text: widget.userModel?.name);
  late final TextEditingController _emailController =
      TextEditingController(text: widget.userModel?.email);
  late final TextEditingController _birthdayController =
      TextEditingController(text: widget.userModel?.birthday?.toString());
  late final TextEditingController _genderController =
      TextEditingController(text: widget.userModel?.gender?.toString());

  Future<void> _updateUserInfo() async {
    if (widget.userModel != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userModel!.userId)
            .update(
          {
            'name': _usernameController.text,
            'email': _emailController.text,
            'birthday': _birthdayController.text,
            'gender': _genderController.text,
          },
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(Gaps.largeSecond),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.loginImageSecond),
              const Align(
                child: Text(
                  'Update profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: Gaps.large),
              const Text('Username'),
              TextFieldProfile(
                  controller: _usernameController, hintTextName: 'Username'),
              SizedBox(height: Gaps.large),
              const Text('Email'),
              TextFieldProfile(
                controller: _emailController,
                hintTextName: 'Email',
              ),
              SizedBox(height: Gaps.large),
              const Text('Gender'),
              TextFieldProfile(
                controller: _genderController,
                hintTextName: 'Gender',
              ),
              SizedBox(height: Gaps.large),
              const Text('Birthday'),
              TextFieldProfile(
                controller: _birthdayController,
                hintTextName: 'Birthday',
              ),
              SizedBox(height: Gaps.large),
              AppButton(
                onPressed: _updateUserInfo,
                title: 'Save changes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
