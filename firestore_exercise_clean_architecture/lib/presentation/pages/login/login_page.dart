import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import '../../constants/assets.dart';
import '../../constants/constants.dart';
import '../../constants/gaps.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/general/gesture_detector.dart';
import '../../widgets/general/gesture_detector_images.dart';
import '../../widgets/general/text_field.dart';
import '../email/email_page.dart';
import '../main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          } else if (state is AuthStateFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? ''),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: Gaps.large),
              child: Padding(
                padding: EdgeInsets.all(Gaps.extraLarge + 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.loginImage,
                      width: Constants.loginImageSize,
                      height: Constants.loginImageSize,
                    ),
                    Align(
                      child: Text(
                        'Log in',
                        style: AppTheme.of(context)
                            .bodyTitle
                            .copyWith(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: AppTheme.of(context).bodyTitle.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    TextFieldWidget(controller: _emailController),
                    SizedBox(height: Gaps.medium),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                        controller: _passwordController, changeObscure: true),
                    SizedBox(height: Gaps.large),
                    AppButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                _emailController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                      title: 'Login',
                    ),
                    SizedBox(height: Gaps.largeSecond),
                    const GestureDetectorImages(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No account? '),
                        GestureDetectorWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmailPage(),
                              ),
                            );
                          },
                          title: 'Sign up',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
