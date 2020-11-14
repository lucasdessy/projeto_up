import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/splash_page/components/gradient.dart';
import 'package:projeto_up/utils/up_text.dart';

class SplashPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPageGradient(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/png/stars.png',
                width: Get.width,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/png/foguete.png',
                height: Get.height / 3.5,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 95),
                child: Text(
                  "Seja bem-vindo!",
                  style: UpText.BoldWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
