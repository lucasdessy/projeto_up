import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_bloc.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';
import 'package:projeto_up/ui/pages/search_tab/search_tab_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(HomeTabController());
    Get.put(SearchTabController());
    Get.put(ProjectPageController(), tag: "myProfile");
    Get.lazyPut(() => ProjectPageController(), fenix: true, tag: "tab1");
    Get.lazyPut(() => ProjectPageController(), fenix: true, tag: "tab2");
  }
}

class HomePageController extends GetxController {
  RxInt activeIndex = 0.obs;

  Color getColor(int index) => index == activeIndex()
      ? UpColors.primary_dark
      : UpColors.wireframe_darkest;

  void handleNavBarTap(int index) {
    activeIndex.value = index;
  }
}
