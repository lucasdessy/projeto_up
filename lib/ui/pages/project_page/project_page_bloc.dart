import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/startup_service.dart';

class ProjectPageController extends GetxController {
  final PageController pageController = PageController();
  final StartupService startupService = Get.find();
  Startup startup = Startup();
  RxBool loading = true.obs;
  bool isNotPersonal = Get.parameters["notPersonal"] == "true";
  String startupId = Get.parameters["startupId"];
  int currentIndex = 0;

  @override
  void onInit() {
    _loadControllerListener();
    super.onInit();
  }

  @override
  void onReady() {
    _loadCompany();
    super.onReady();
  }

  void _loadControllerListener() {
    pageController.addListener(() {
      if (currentIndex != pageController.page.round()) {
        currentIndex = pageController.page.round();
        loading.refresh(); // Sim, meio gambiarra, mas funciona :(
      }
    });
  }

  void animateTo(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void _loadCompany() async {
    loading.value = true;
    if (!isNotPersonal) {
      loading.value = false;
      startup = Startup(
          nome: "Carregando...",
          capaUrl: "",
          pitchUrl: "",
          segmento: "",
          descricao: "",
          album: [""],
          membros: [Membro(cargo: "", nomeMembro: "")],
          id: "",
          outrosContatos: [""],
          facebook: "",
          instagram: "",
          whatsapp: "");
      return;
    }
    startup = await startupService.getStartup(startupId);
    loading.value = false;
  }

  Color getColor(int index) {
    final Color activeColor = Color.fromARGB(255, 54, 1, 168);
    final Color inactiveColor = Color.fromARGB(255, 255, 255, 255);
    if (index == currentIndex) return activeColor;
    return inactiveColor;
  }
}
