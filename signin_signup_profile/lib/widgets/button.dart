import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.globalKey, this.text, this.width, this.height,
      this.color, this.textColor,
      {super.key});

  final GlobalKey<FormState> globalKey;
  final String text;
  final double width;
  final double height;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (globalKey.currentState != null &&
            globalKey.currentState!.validate()) {
          Navigator.pushNamed(context, '/profile-page');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: color,
        width: width,
        height: height,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
