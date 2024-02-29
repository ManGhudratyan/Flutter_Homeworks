import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget(
      {this.validator,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      super.key});

  final String? Function(String?)? validator;
  final String? hintText;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _globalKey,
      validator: widget.validator,
      style: const TextStyle(fontSize: 16),
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color.fromRGBO(247, 247, 247, 1),
      ),
    );
  }
}
