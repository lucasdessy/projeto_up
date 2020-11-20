import 'package:get/get.dart';

class EquipeEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EquipeEditPageController());
  }
}

class EquipeEditPageController extends GetxController {}
