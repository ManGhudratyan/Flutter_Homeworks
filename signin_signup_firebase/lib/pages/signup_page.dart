import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signin_signup_firebase/pages/login_page.dart';
import 'package:signin_signup_firebase/services/preference_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String email;
  late String name;
  late String birthday;
  late String gender;

  final TextEditingController _birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final data = await PreferencesService.loadData();
    setState(() {
      email = data['email'] ?? '';
      name = data['name'] ?? '';
      birthday = data['birthday'] ?? '';
      gender = data['gender'] ?? '';

      _birthdayController.text = birthday;
    });
  }

  Future<void> _saveData() async {
    await PreferencesService.saveData(
      email: email,
      name: name,
      birthday: birthday,
      gender: gender,
    );
  }

  void updateField(String field, String value) {
    setState(() {
      switch (field) {
        case 'email':
          email = value;
          break;
        case 'name':
          name = value;
          break;
        case 'birthday':
          birthday = value;
          break;
        case 'gender':
          gender = value;
          break;
        default:
          break;
      }
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'images/image_2.png',
                    width: 300,
                    height: 300,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(54, 69, 79, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircle(email.isNotEmpty),
                    _buildCircle(name.isNotEmpty),
                    _buildCircle(birthday.isNotEmpty),
                    _buildCircle(gender.isNotEmpty),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Email', style: TextStyle(color: Colors.grey)),
                    Text('Name', style: TextStyle(color: Colors.grey)),
                    Text('Birthday', style: TextStyle(color: Colors.grey)),
                    Text('Gender', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField('Email', 'email'),
                const SizedBox(height: 20),
                _buildTextField('Name', 'name'),
                const SizedBox(height: 20),
                _buildTextField('Birthday', 'birthday'),
                const SizedBox(height: 20),
                _buildTextField('Gender', 'gender'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
                  ),
                  child: const Text('Continue',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Sign up with', style: TextStyle(fontSize: 18)),
                    Image.asset('images/google.png', width: 25, height: 28),
                    Image.asset('images/facebook.png', width: 25, height: 28),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(bool filled) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Colors.green : Colors.grey,
      ),
      child: filled ? const Icon(Icons.done, color: Colors.white) : null,
    );
  }

  Widget _buildTextField(String label, String field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        TextField(
          onChanged: (value) => updateField(field, value),
          controller: field == 'birthday' ? _birthdayController : null,
          keyboardType: field == 'birthday' ? TextInputType.datetime : null,
          inputFormatters: field == 'birthday'
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ]
              : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            fillColor: const Color.fromRGBO(211, 211, 211, 1),
            filled: true,
            hintText: field == 'birthday' ? 'DD/MM/YYYY' : null,
          ),
        ),
      ],
    );
  }
}
