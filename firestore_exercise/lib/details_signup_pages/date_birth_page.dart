import 'package:firestore_exercise/details_signup_pages/gender_page.dart';
import 'package:firestore_exercise/logic/user/user_bloc.dart';
import 'package:firestore_exercise/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateBirth extends StatefulWidget {
  const DateBirth({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<DateBirth> createState() => _DateBirthState();
}

class _DateBirthState extends State<DateBirth> {
  final TextEditingController _textController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _textController.text = DateFormat('yyyy/MM/dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? 'An error occurred'),
            ),
          );
        } else if (state is UserDataUpdated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GenderPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(''),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'images/image_1.png',
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _textController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 211, 211, 1),
                      filled: true,
                      hintText: 'YYYY/MM/DD',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedDate != null) {
                        context
                            .read<UserBloc>()
                            .add(UpdateBirthdayEvent(_selectedDate!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your birthday.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Sign up with',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'images/google.png',
                          width: 25,
                          height: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'images/facebook.png',
                          width: 25,
                          height: 28,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      GestureDetector(
                        onTap: () {
                          // Handle log in
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
