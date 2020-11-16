import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/projects_service.dart';

class SearchTabBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchTabController());
  }
}

class SearchTabController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final StartupService startupService = Get.find();
  final ProjectsService projectsService = Get.find();
  bool get loading {
    return startupService.loading() || projectsService.loading();
  }

  Future<void> handleReload() async {
    await startupService.reloadCompanies();
    await projectsService.reloadProjects();
  }

  List<dynamic> get projectsStartupsList {
    List<dynamic> _tempList = [
      ...startupService.startupsList,
      ...projectsService.projectsList
    ];
    _tempList.shuffle(); //TODO make something better to do with this
    return _tempList;
  }

  void handleCardTap(String startupId) {
    Get.toNamed("${RouterService.PROJECTS}$startupId", id: 2);
  }
}
