import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/app_service.dart';
import 'package:projeto_up/services/user_service.dart';

class StartupEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StartupEditPageController());
  }
}

class StartupEditPageController extends GetxController {
  final AppService appService = Get.find();
  final UserService userService = Get.find();
  final formKey = GlobalKey<FormState>();
  final Rx<Startup> startup = Startup().obs;
  final TextEditingController startupController = TextEditingController();
  final TextEditingController segmentoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  void onInit() {
    Startup _startup = userService.startupPessoalStream();
    startup.value = _startup.clone();
    startupController.text = startup().nome;
    segmentoController.text = startup().segmento;
    descricaoController.text = startup().descricao;
    super.onInit();
  }

  bool get imageLoading {
    return appService.isImageLoading;
  }

  void handleChoosePicture() async {
    final String _capaUrl = await appService.uploadImage(userService.userId);
    if (_capaUrl != null) {
      startup.value.capaUrl = _capaUrl;
      startup.refresh();
    }
  }

  void handleSaveStartup() async {
    if (formKey.currentState.validate()) {
      try {
        startup.value.nome = startupController.text;
        startup.value.segmento = segmentoController.text;
        startup.value.descricao = descricaoController.text;
        await userService.saveStartup(startup());
        Get.back();
      } catch (e) {
        Get.snackbar("Erro ao salvar startup", e.toString());
      }
    }
  }
}
