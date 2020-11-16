import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';

class HomeTabBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeTabController());
  }
}

class HomeTabController extends GetxController {
  final StartupService startupService = Get.find();

  RxBool get loading {
    return startupService.loading;
  }

  Map<String, List<Startup>> get startups {
    return startupService.startups;
  }

  Future<void> handleReload() async {
    await startupService.reloadCompanies();
  }

  void handleCardTap(String startupId) {
    Get.toNamed("${RouterService.PROJECTS_1}$startupId?notPersonal=true",
        id: 1);
  }
}
