import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/user_service.dart';

class ContatosEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ContatosEditPageController());
  }
}

class ContatosEditPageController extends GetxController {
  final UserService userService = Get.find();
  final Rx<Startup> startup = Startup().obs;
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final RxList<TextEditingController> outrosControllerList =
      List<TextEditingController>().obs;
  final List<VoidCallback> outrosCallbackList = List<Function()>();
  final RxBool canAddMore = false.obs;

  @override
  void onInit() {
    Startup _startup = userService.startupPessoalStream();
    startup.value = _startup.clone();
    facebookController.text = startup().facebook;
    instagramController.text = startup().instagram;
    whatsappController.text = startup().whatsapp;
    if (_startup.outrosContatos.length == 0) {
      outrosControllerList.value.add(TextEditingController());
      outrosCallbackList
          .add(() => _controllerListener(outrosControllerList[0]));
      outrosControllerList[0].addListener(outrosCallbackList[0]);
    } else {
      for (final contato in _startup.outrosContatos) {
        handleAddTextController(text: contato);
      }
      canAddMore.value = true;
    }
    super.onInit();
  }

  void _controllerListener(TextEditingController cont) {
    print("listening");
    if (cont.text.isNullOrBlank) {
      canAddMore.value = false;
    } else {
      canAddMore.value = true;
    }
    return null;
  }

  void handleAddTextController({String text}) {
    int _lastIndex = outrosControllerList.length - 1;
    int _currIndex = outrosControllerList.length;
    if (!_lastIndex.isNegative) {
      outrosControllerList[_lastIndex]
          .removeListener(outrosCallbackList[_lastIndex]);
    }
    outrosControllerList.value.add(TextEditingController());
    if (text != null) {
      outrosControllerList[_currIndex].text = text;
    }
    outrosCallbackList
        .add(() => _controllerListener(outrosControllerList[_currIndex]));
    outrosControllerList[_currIndex]
        .addListener(outrosCallbackList[_currIndex]);
    canAddMore.value = false;
    outrosControllerList.refresh();
  }

  void handleSaveStartup() async {
    try {
      startup.value.facebook = facebookController.text;
      startup.value.instagram = instagramController.text;
      startup.value.whatsapp = whatsappController.text;
      startup.value.outrosContatos = List<String>();
      for (final textController in outrosControllerList) {
        startup.value.outrosContatos.add(textController.text);
      }
      await userService.saveStartup(startup());
      Get.back();
    } catch (e) {
      Get.snackbar("Erro ao salvar startup", e.toString());
    }
  }
}
