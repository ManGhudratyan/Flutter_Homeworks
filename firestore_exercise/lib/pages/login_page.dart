import 'package:firestore_exercise/details_signup_pages/email_page.dart';
import 'package:firestore_exercise/details_signup_pages/main_page.dart';
import 'package:firestore_exercise/logic/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              padding: const EdgeInsets.only(top: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
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
                        'Log in',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
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
                    TextField(
                      controller: _emailController,
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
                    const SizedBox(height: 10),
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
                        ),
                        fillColor: const Color.fromRGBO(211, 211, 211, 1),
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                _emailController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Log in with',
                          style: TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(SignInWithGoogleEvent());
                          },
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
                        const Text('No account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmailPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
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
