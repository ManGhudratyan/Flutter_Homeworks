import 'package:firestore_exercise/details_signup_pages/main_page.dart';
import 'package:firestore_exercise/logic/auth/auth_bloc.dart';
import 'package:firestore_exercise/logic/user/user_bloc.dart';
import 'package:firestore_exercise/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  Gender? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.userModel?.gender;
  }

  void _onGenderSelected(Gender? gender) {
    setState(() {
      _selectedGender = gender;
    });
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
          context.read<UserBloc>().add(
                SubmitUserEvent(
                  UserModel(
                    userId: context.read<AuthBloc>().state.userId,
                    name: state.name,
                    email: state.email,
                    birthday: state.birthday,
                    gender: state.gender,
                  ),
                ),
              );
        } else if (state is UserLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
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
                      'Your Gender',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RadioListTile<Gender>(
                    title: const Text('Female'),
                    value: Gender.female,
                    groupValue: _selectedGender,
                    onChanged: _onGenderSelected,
                  ),
                  RadioListTile<Gender>(
                    title: const Text('Male'),
                    value: Gender.male,
                    groupValue: _selectedGender,
                    onChanged: _onGenderSelected,
                  ),
                  RadioListTile<Gender>(
                    title: const Text('Other'),
                    value: Gender.other,
                    groupValue: _selectedGender,
                    onChanged: _onGenderSelected,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedGender != null) {
                        context
                            .read<UserBloc>()
                            .add(UpdateGenderEvent(_selectedGender!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select your gender.'),
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
                      Image.asset(
                        'images/facebook.png',
                        width: 25,
                        height: 28,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      GestureDetector(
                        onTap: () {},
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
