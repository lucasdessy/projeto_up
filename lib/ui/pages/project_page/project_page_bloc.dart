import 'dart:math';

import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/startup_service.dart';

class ProjectPageController extends GetxController {
  RxString teste = Random().nextDouble().toString().obs;
  final StartupService startupService = Get.find();
  Startup startup = Startup();
  RxBool loading = true.obs;
  bool isNotPersonal = Get.parameters["notPersonal"] == "true";
  String startupId = Get.parameters["startupId"];
  @override
  void onInit() {
    print(teste.value);
    print(Get.parameters);
    _loadCompany();
    super.onInit();
  }

  void _loadCompany() async {
    loading.value = true;
    if (!isNotPersonal) {
      loading.value = false;
      startup = Startup(nome: "Carregando...", capaUrl: "", pitchUrl: "");
      return;
    }
    startup = await startupService.getStartup(startupId);
    loading.value = false;
  }
}
