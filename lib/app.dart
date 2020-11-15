import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/utils/up_colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "up!",
      initialRoute: RouterService.SIMPLE_SPLASH,
      getPages: RouterService().pages,
      theme: ThemeData(
        primaryColor: UpColors.primary_dark,
      ),
    );
  }
}
