import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/utils/up_colors.dart';

class SimpleSplashPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: UpColors.primary,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: SvgPicture.asset(
          'assets/svg/up-splash.svg',
          width: 162,
        ),
      ),
    );
  }
}
