import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/svg/back-arrow.svg',
        width: 20,
        height: 20,
        color: Color.fromARGB(255, 85, 85, 85),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
