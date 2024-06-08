// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_exercise/details_signup_pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firestore_exercise/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.userModel});
  final UserModel? userModel;

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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/image_2.png'),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Update profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Username'),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Email'),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Gender'),
              TextField(
                controller: _genderController,
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Birthday'),
              TextField(
                controller: _birthdayController,
                decoration: const InputDecoration(
                  hintText: 'Birthday',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUserInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
                ),
                child: const Text(
                  'Save changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
