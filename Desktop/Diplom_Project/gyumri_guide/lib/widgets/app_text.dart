import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double size;
  final String text;
  final Color colour;

  const AppText({super.key,
    this.size = 16,
    required this.text,
    this.colour = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: colour,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
