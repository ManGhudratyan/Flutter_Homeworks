import 'package:flutter/material.dart';
import 'package:gyumri_guide/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;

  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({super.key,
    this.isIcon = false,
    this.text = "Hi",
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),

      ),

      // TODO: change colour
      child: isIcon == false ?
      Center(child: AppText(text: text!, colour: color,)) :
      Center(child: Icon(icon, color:color)),

    );
  }
}
