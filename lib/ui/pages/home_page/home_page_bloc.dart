import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/startup_service.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final StartupService startupService = Get.find();

  RxBool get loading {
    return startupService.loading;
  }

  Map<String, List<Startup>> get startups {
    return startupService.startups;
  }

  void handleReload() {}
}
