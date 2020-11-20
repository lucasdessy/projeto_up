import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/app_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/user_service.dart';

class AddPhotoPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddPhotoPageController());
  }
}

class AddPhotoPageController extends GetxController {
  final AppService appService = Get.find();
  final UserService userService = Get.find();
  final StartupService startupService = Get.find();
  final formKey = GlobalKey<FormState>();
  final TextEditingController descController = TextEditingController();
  final Rx<Startup> tempStartup = Rx<Startup>();

  @override
  void onInit() {
    if (Get.arguments is Startup) {
      tempStartup.value = Get.arguments as Startup;
    } else {
      Get.back();
    }
    super.onInit();
  }

  bool get imageLoading {
    return appService.isImageLoading;
  }

  bool get loading {
    return userService.isLoading || startupService.loading;
  }

  void handleCreateStartup() async {
    tempStartup.value.descricao = descController.text;
    final String _startupId = await startupService.uploadStartup(tempStartup());
    await userService.uploadUser(_startupId);
    Get.until((route) => route.isFirst);
  }

  void handleChoosePicture() async {
    final String _capaUrl = await appService.uploadImage(userService.userId);
    if (_capaUrl != null) {
      tempStartup.value.capaUrl = _capaUrl;
      tempStartup.refresh();
    }
  }
}
