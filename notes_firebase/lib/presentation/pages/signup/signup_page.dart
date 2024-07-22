import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/gaps.dart';
import '../../logic/bloc/auth_bloc.dart';
import '../../widgets/general/text_form_widget.dart';
import '../login/components/login_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _enterPassword = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed && state == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? ''),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(Gaps.largeSecond),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Text('Sign Up / ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                      Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          )),
                    ],
                  ),
                  SizedBox(height: Gaps.large),
                  TextFormWidget(
                      controller: _usernameController, hintText: 'Username'),
                  SizedBox(height: Gaps.large),
                  TextFormWidget(
                    controller: _enterPassword,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: Gaps.large),
                  TextFormWidget(
                    controller: _reEnterPassword,
                    hintText: 'Re-enter password',
                    obscureText: true,
                  ),
                  SizedBox(height: Gaps.largeSecond),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: LoginButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                _usernameController.text,
                                _enterPassword.text,
                              ),
                            );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const NotesPage(),
                        //   ),
                        // );
                      },
                      title: 'Sign up',
                    ),
                  ),
                  SizedBox(height: Gaps.large),
                  const Text('Already have an account? ',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 156, 166, 173)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
