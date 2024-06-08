import 'package:flutter/material.dart';
import 'package:signin_signup_firebase/pages/signup_page.dart';
import 'package:signin_signup_firebase/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                  child: Text('Log in',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(54, 69, 79, 1),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextField(
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
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextField(
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
                  onPressed: () async {
                    // final userCredential =
                    //     await _authService.signInWithGoogle();
                    // if (userCredential != null) {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const HomePage(email: ,),
                    //     ),
                    //   );
                    // }
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
                    Image.asset(
                      'images/google.png',
                      width: 25,
                      height: 28,
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
                            builder: (context) => const SignUpPage(),
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
        ),);
  }
}
