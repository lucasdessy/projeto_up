import 'package:get/get.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/projects_service.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/user_service.dart';

class ProjectPageController extends GetxController {
  final UserService userService = Get.find();
  final StartupService startupService = Get.find();
  final ProjectsService projectsService = Get.find();
  Rx<Startup> startup = Startup().obs;
  bool isNotPersonal = Get.parameters["notPersonal"] == "true";
  String startupId = Get.parameters["startupId"];
  List<Projeto> projects = List<Projeto>().obs;

  bool get canDisplay {
    return (userService.isLoggedIn && userService.hasCompany);
  }

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
    return startupService.loading || projectsService.loading;
  }

  void _loadCompany() async {
    if (isNotPersonal) {
      startup.value = await startupService.getStartup(startupId);
      projects = await projectsService.getProjectsById(startupId);
      return;
    } else {
      startup = userService.startupPessoalStream;
      projects = userService.projetosPessoais;
    }
  }

  void handleLogout() async {
    if (await userService.signOut()) {
      Get.toNamed(RouterService.LOG_IN);
    }
  }
}
