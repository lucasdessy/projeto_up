import 'package:get/get.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/startup_service.dart';

class ProjectPageController extends GetxController {
  final StartupService startupService = Get.find();
  Startup startup = Startup();
  RxBool loading = true.obs;
  bool isNotPersonal = Get.parameters["notPersonal"] == "true";
  String startupId = Get.parameters["startupId"];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _loadCompany();
    super.onReady();
  }

  void _loadCompany() async {
    loading.value = true;
    if (!isNotPersonal) {
      loading.value = false;
      startup = Startup(
          nome: "Carregando...",
          capaUrl: "",
          pitchUrl: "",
          segmento: "",
          descricao: "",
          album: [""],
          membros: [Membro(cargo: "", nomeMembro: "")],
          id: "",
          outrosContatos: [""],
          facebook: "",
          instagram: "",
          whatsapp: "");
      return;
    }
    startup = await startupService.getStartup(startupId);
    loading.value = false;
  }
}
