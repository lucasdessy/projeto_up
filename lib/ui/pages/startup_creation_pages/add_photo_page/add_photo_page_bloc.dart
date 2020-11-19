import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';

class AddPhotoPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddPhotoPageController());
  }
}

class AddPhotoPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController descController = TextEditingController();
  Rx<Startup> tempStartup = Rx<Startup>();
  @override
  void onInit() {
    if (Get.arguments is Startup) {
      tempStartup.value = Get.arguments as Startup;
    } else {
      Get.back();
    }
    super.onInit();
  }

  void handleCreateStartup() {}
}
