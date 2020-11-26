import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/services/app_service.dart';
import 'package:projeto_up/services/user_service.dart';

class ProjetoEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProjetoEditPageController());
  }
}

class ProjetoEditPageController extends GetxController {
  final AppService appService = Get.find();
  final UserService userService = Get.find();
  final formKey = GlobalKey<FormState>();
  final Rx<Projeto> projeto = Projeto().obs;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  bool get imageLoading {
    return appService.isImageLoading;
  }

  void handleChoosePicture() async {
    final String _capaUrl = await appService.uploadImage(userService.userId);
    if (_capaUrl != null) {
      projeto.value.capaUrl = _capaUrl;
      projeto.refresh();
    }
  }

  void handleSaveProjeto() async {
    if (formKey.currentState.validate()) {
      try {
        projeto.value.nomeProjeto = nomeController.text;
        projeto.value.descricao = descController.text;
        projeto.value.anoCriado = DateTime.now().year;
        projeto.value.visualizacoes = 0;
        await userService.saveProjeto(projeto());
        Get.back();
      } catch (e) {
        Get.snackbar("Erro ao salvar projeto", e.toString());
      }
    }
  }
}
