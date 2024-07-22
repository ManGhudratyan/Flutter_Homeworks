import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed, required this.title});
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(24, 75, 255, 1)),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
