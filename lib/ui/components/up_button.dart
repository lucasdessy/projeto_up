import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class UpButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const UpButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: UpColors.primary_dark,
        child: Container(
          height: 50,
          width: double.infinity,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                "$text",
                style: UpText.UpButtonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
