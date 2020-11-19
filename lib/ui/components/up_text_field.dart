import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_text.dart';

class UpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final bool obscureText;
  const UpTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.icon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: UpText.SearchFieldActive,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconConstraints: BoxConstraints.expand(height: 20, width: 43),
        prefixIcon: icon,
        focusedBorder: InputBorder.none,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 247, 247, 247)),
        ),
        fillColor: Color.fromARGB(255, 247, 247, 247),
        filled: true,
        hintStyle: UpText.SearchField,
      ),
    );
  }
}
