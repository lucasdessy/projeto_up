import 'package:get/get.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/projects_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/user_service.dart';

class ProjectPageController extends GetxController {
  final UserService userService = Get.find();
  final StartupService startupService = Get.find();
  final ProjectsService projectsService = Get.find();
  Startup startup = Startup();
  bool isNotPersonal = Get.parameters["notPersonal"] == "true";
  String startupId = Get.parameters["startupId"];
  List<Projeto> projects = List<Projeto>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _loadCompany();
    super.onReady();
  }

  bool get loading {
    return startupService.loading() || projectsService.loading();
  }

  void _loadCompany() async {
    if (!isNotPersonal) {
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
    projects = await projectsService.getProjectsById(startupId);
  }
}
