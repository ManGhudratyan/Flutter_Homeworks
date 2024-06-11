import 'package:flutter/material.dart';

import '../../constants/gaps.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.changeObscure,
  });
  final TextEditingController controller;
  final bool? changeObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: changeObscure ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Gaps.large + 4),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        fillColor: const Color.fromRGBO(211, 211, 211, 1),
        filled: true,
      ),
    );
  }
}
