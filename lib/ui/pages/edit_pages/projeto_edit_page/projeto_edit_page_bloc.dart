import 'package:get/get.dart';

class ProjetoEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProjetoEditPageController());
  }
}

class ProjetoEditPageController extends GetxController {}
