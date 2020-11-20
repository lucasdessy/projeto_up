import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/projects_service.dart';
import 'package:projeto_up/services/router_service.dart';
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
  final ProjectsService projectsService = Get.find();
  final RxBool _loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _listenToController();
  }

  void _listenToController() {
    searchController.addListener(() {
      print("Texto: ${searchController.text}");
      _loading.refresh(); // gambiarra que funciona :(
    });
  }

  bool get loading {
    return startupService.loading || projectsService.loading || _loading();
  }

  Future<void> handleReload() async {
    await startupService.reloadCompanies();
    await projectsService.reloadProjects();
  }

  List<dynamic> get projectsStartupsList {
    List<dynamic> _tempList = List<dynamic>();
    if (searchController.text.isNullOrBlank) {
      _tempList = [
        ...startupService.startupsList,
        ...projectsService.projectsList
      ];
    } else {
      _tempList = [
        ...startupService.startupsList
            .where((startup) =>
                removeDiacritics(startup.segmento.toUpperCase()).contains(
                    removeDiacritics(searchController.text.toUpperCase())) ||
                removeDiacritics(startup.nome.toUpperCase()).contains(
                    removeDiacritics(searchController.text.toUpperCase())))
            .toList(),
        ...projectsService.projectsList.where(
            (projeto) => projeto.nomeProjeto.contains(searchController.text))
      ];
    }
    _tempList.shuffle(); //TODO make something better to do with this
    return _tempList;
  }

  void handleCardTap(String startupId) {
    Get.toNamed("${RouterService.PROJECTS_2}$startupId?notPersonal=true",
        id: 1);
  }
}
