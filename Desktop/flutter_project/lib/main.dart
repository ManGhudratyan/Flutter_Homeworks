import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(45, 180, 45, 20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(223, 223, 223, 1),
                  hintText: 'Username',
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(189, 189, 184, 1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(189, 189, 184, 1)),
                  filled: true,
                  fillColor: const Color.fromRGBO(223, 223, 223, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot your password?',
                      style: TextStyle(
                          color: Color.fromRGBO(189, 189, 184, 1),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(156, 223, 231, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: null,
                  child: const SizedBox(
                    width: 500,
                    height: 25,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )),
              const SizedBox(height: 20),
              const Text('or',
                  style: TextStyle(
                      color: Color.fromRGBO(189, 189, 184, 1),
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(189, 189, 184, 1)),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Image.asset('images/facebook.png'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(189, 189, 184, 1)),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Image.asset('images/twitter.png'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(189, 189, 184, 1)),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Image.asset('images/linkedin.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Don\'t have an account?'),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(248, 191, 255, 1),
                      color: Color.fromRGBO(248, 191, 255, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
