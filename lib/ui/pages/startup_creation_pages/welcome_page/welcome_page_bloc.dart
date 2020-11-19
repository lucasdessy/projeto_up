import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/router_service.dart';

class WelcomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WelcomePageController());
  }
}

class WelcomePageController extends GetxController {
  static const String defaultText = "Startup,"
      "\nsejam bem-vindos ao up!";
  final formKey = GlobalKey<FormState>();
  final startupController = TextEditingController();
  final segmentoController = TextEditingController();
  final instagramController = TextEditingController();
  final faceBookController = TextEditingController();
  final whatsAppController = TextEditingController();
  final RxString startupText = defaultText.obs;

  @override
  void onInit() {
    startupController.addListener(() {
      if (startupController.text.isNullOrBlank) {
        startupText.value = defaultText;
      } else {
        startupText.value = "${startupController.text},"
            "\nsejam bem-vindos ao up!";
      }
    });
    super.onInit();
  }

  void handleGoToNextPage() {
    if (formKey.currentState.validate()) {
      Startup _tempStartup = Startup(
        nome: startupController.text,
        segmento: segmentoController.text,
        instagram: instagramController.text,
        facebook: faceBookController.text,
        whatsapp: whatsAppController.text,
      );
      Get.toNamed(RouterService.ADD_PHOTO, arguments: _tempStartup);
    }
  }
}
