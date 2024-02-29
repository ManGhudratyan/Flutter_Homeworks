import 'package:flutter/material.dart';
import 'package:signin_signup_profile/widgets/button.dart';
import 'package:signin_signup_profile/widgets/container.dart';
import 'package:signin_signup_profile/widgets/textform.dart';
import 'package:flutter/gestures.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(82, 84, 100, 1),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              IconButton(
                onPressed: null,
                padding: const EdgeInsets.only(top: 60),
                icon: Container(
                  width: 100,
                  height: 145,
                  child: Image.asset('images/image_1.png'),
                ),
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    TextFormWidget(
                      hintText: 'Username',
                      obscureText: false,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Invalid username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormWidget(
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Invalid password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                        _globalKey,
                        'Login',
                        315,
                        60,
                        const Color.fromRGBO(32, 195, 175, 1),
                        const Color.fromRGBO(255, 255, 255, 1)),
                    const SizedBox(height: 20),
                    const Text('or',
                        style: TextStyle(
                            color: Color.fromRGBO(131, 131, 145, 1),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    const ContainerWidget(),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 177, 157, 1),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/sign-up');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
