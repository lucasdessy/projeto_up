import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "up!",
      initialRoute: RouterService.SPLASH,
      getPages: RouterService().pages,
    );
  }
}
