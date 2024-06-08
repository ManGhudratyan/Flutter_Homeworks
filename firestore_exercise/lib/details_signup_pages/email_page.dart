import 'package:firestore_exercise/core/extensions/scaffold_messenger.dart';
import 'package:firestore_exercise/details_signup_pages/name_page.dart';
import 'package:firestore_exercise/logic/auth/auth_bloc.dart';
import 'package:firestore_exercise/logic/user/user_bloc.dart';
import 'package:firestore_exercise/models/user_model.dart';
import 'package:firestore_exercise/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateFailed) {
          state.error.showErrorSnackBar(context);
        } else if (state is AuthRegistered && state.userId != null) {
          context.read<UserBloc>().add(UpdateEmailEvent(_textController.text));
        }
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? ''),
              ),
            );
          } else if (state is UserDataUpdated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NamePage(),
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
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: const Color.fromRGBO(211, 211, 211, 1),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: const Color.fromRGBO(211, 211, 211, 1),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final email = _textController.text.trim();
                        final password = _passwordController.text.trim();
                        if (email.isNotEmpty && password.isNotEmpty) {
                          context
                              .read<AuthBloc>()
                              .add(SignUpEvent(email, password));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter your email'),
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
                        )
                      ],
                    ),
                    const Divider(),
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
      ),
    );
  }
}
