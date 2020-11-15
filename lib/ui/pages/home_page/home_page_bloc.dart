import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(HomeTabController());
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
