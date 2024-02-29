import 'package:flutter/material.dart';
import 'package:signin_signup_profile/widgets/button.dart';
import 'package:signin_signup_profile/widgets/container.dart';
import 'package:signin_signup_profile/widgets/textform.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
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
                  child: Image.asset('images/image_2.png'),
                ),
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    TextFormWidget(
                      hintText: 'Enter email',
                      obscureText: false,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormWidget(
                      hintText: 'Enter password',
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Invalid password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormWidget(
                      hintText: 'Confirm password',
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    ButtonWidget(
                        _globalKey,
                        'Sign up',
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
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 177, 157, 1),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
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
