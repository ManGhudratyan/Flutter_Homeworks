import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/gender.dart';
import '../../../domain/entities/user_entity.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../logic/user/user_bloc.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/general/gesture_detector.dart';
import '../../widgets/general/gesture_detector_images.dart';
import '../main/main_page.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key, this.userModel});
  final UserEntity? userModel;

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  Gender? _selectedGender;

  @override
  void initState() {
    super.initState();
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
                  UserEntity(
                    userId: context.read<AuthBloc>().state.userId,
                    name: state.name,
                    email: state.email,
                    birthday: state.birthday,
                    gender: state.gender?.name,
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
                    value: Gender.unspecified,
                    groupValue: _selectedGender,
                    onChanged: _onGenderSelected,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
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
                    title: 'Continue',
                  ),
                  const SizedBox(height: 20),
                  const GestureDetectorImages(),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      GestureDetectorWidget(
                        onTap: () {},
                        title: 'Log in',
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
