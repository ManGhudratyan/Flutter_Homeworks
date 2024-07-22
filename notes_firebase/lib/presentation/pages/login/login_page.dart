import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/gaps.dart';
import '../../logic/bloc/auth_bloc.dart';
import '../../widgets/general/text_form_widget.dart';
import 'components/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
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
                      Text('LOGIN / ',
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      Text('Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                    ],
                  ),
                  TextFormWidget(
                      controller: _usernameController, hintText: 'Username'),
                  TextFormWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: Gaps.largeSecond),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: LoginButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                _usernameController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                      title: 'Login',
                    ),
                  ),
                  SizedBox(height: Gaps.large),
                  const Text('Dont have an account? ',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 156, 166, 173)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup-page');
                    },
                    child: const Text(
                      'Sign up',
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
