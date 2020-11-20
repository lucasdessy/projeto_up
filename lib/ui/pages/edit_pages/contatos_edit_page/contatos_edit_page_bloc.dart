import 'package:get/get.dart';

class ContatosEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ContatosEditPageController());
  }
}

class ContatosEditPageController extends GetxController {}
