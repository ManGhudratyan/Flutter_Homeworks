import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {

  final double size;
  final String text;
  final Color colour;

  const AppLargeText({super.key,
  this.size = 30,
  required this.text,
  this.colour = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: colour,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
