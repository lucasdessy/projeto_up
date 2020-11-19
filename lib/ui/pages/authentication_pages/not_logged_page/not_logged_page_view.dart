import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_header_no_sliver.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class NotLoggedPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      appBar: UpHeaderNoSliver(),
      body: Padding(
        padding: EdgeInsets.only(
            left: 20, right: 20, bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 42,
                right: 42,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/png/start.png',
                    height: 284,
                  ),
                  Text(
                    "Conecte sua startup com o up!",
                    style: UpText.NotLoggedTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 34,
            ),
            UpButton(
              text: "Entrar",
              onTap: () {
                Get.toNamed(RouterService.LOG_IN);
              },
            )
          ],
        ),
      ),
    );
  }
}
