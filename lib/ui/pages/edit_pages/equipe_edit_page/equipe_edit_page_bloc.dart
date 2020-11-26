import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/services/app_service.dart';
import 'package:projeto_up/services/user_service.dart';

class EquipeEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EquipeEditPageController());
  }
}

class EquipeEditPageController extends GetxController {
  final AppService appService = Get.find();
  final UserService userService = Get.find();
  final formKey = GlobalKey<FormState>();
  final Rx<Membro> membro = Membro().obs;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  bool get imageLoading {
    return appService.isImageLoading;
  }

  void handleChoosePicture() async {
    final String _fotoUrl = await appService.uploadImage(userService.userId);
    if (_fotoUrl != null) {
      membro.value.fotoUrl = _fotoUrl;
      membro.refresh();
    }
  }

  void handleSaveMembro() async {
    if (formKey.currentState.validate()) {
      try {
        membro.value.nomeMembro = nomeController.text;
        membro.value.cargo = cargoController.text;
        await userService.saveMembro(membro());
        Get.back();
      } catch (e) {
        Get.snackbar("Erro ao salvar membro", e.toString());
      }
    }
  }
}
