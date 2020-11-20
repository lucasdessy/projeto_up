import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_text.dart';

class UpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final String Function(String) validator;
  final int maxLines;
  const UpTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.icon,
    this.obscureText,
    this.validator,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: UpText.SearchFieldActive,
      obscureText: obscureText ?? false,
      validator: validator,
      maxLines: maxLines ?? 1,
      scrollPhysics: const ClampingScrollPhysics(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconConstraints: BoxConstraints.expand(height: 20, width: 43),
        prefixIcon: icon,
        focusedBorder: InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
        border: InputBorder.none,
        fillColor: Color.fromARGB(255, 247, 247, 247),
        filled: true,
        hintStyle: UpText.SearchField,
      ),
    );
  }
}
