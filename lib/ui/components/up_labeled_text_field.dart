import 'package:flutter/material.dart';
import 'package:projeto_up/ui/components/up_text_field.dart';
import 'package:projeto_up/utils/up_text.dart';

class UpLabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final String topLabel;
  final bool obscureText;
  final String Function(String) validator;
  final int maxLines;

  const UpLabeledTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.icon,
    @required this.topLabel,
    this.obscureText,
    this.validator,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topLabel,
          style: UpText.InputTopText,
        ),
        SizedBox(
          height: 5,
        ),
        UpTextField(
          controller: controller,
          hintText: hintText,
          icon: icon,
          obscureText: obscureText,
          validator: validator,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
