import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validation;
  final bool obscureText;

  const BuildTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validation,
    this.autoValidateMode,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
      validator: validation,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
