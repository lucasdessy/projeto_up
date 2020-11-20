import 'package:get/get.dart';

class StartupEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StartupEditPageController());
  }
}

class StartupEditPageController extends GetxController {}
