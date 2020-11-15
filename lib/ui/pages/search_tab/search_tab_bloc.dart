import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/startup_service.dart';

class SearchTabBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchTabController());
  }
}

class SearchTabController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final StartupService startupService = Get.find();

  RxBool get loading {
    return startupService.loading;
  }

  Future<void> handleReload() async {}
}
