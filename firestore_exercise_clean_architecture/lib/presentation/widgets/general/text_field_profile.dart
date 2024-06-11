import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  const TextFieldProfile(
      {super.key, required this.controller, required this.hintTextName});
  final TextEditingController controller;
  final String hintTextName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTextName,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
