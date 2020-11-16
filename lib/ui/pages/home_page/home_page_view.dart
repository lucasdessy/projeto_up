import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            children: [
              Navigator(
                key: Get.nestedKey(1),
                initialRoute: RouterService.HOME_TAB,
                onGenerateRoute: RouterService.onGenerateRoute,
              ),
              Navigator(
                key: Get.nestedKey(2),
                initialRoute: RouterService.SEARCH_TAB,
                onGenerateRoute: RouterService.onGenerateRoute,
              ),
              Navigator(
                key: Get.nestedKey(3),
                initialRoute: RouterService.MY_PROFILE_TAB,
                onGenerateRoute: RouterService.onGenerateRoute,
              ),
            ],
            index: controller.activeIndex(),
          ),
          bottomNavigationBar: CupertinoTabBar(
            //TODO fazer navbar fiel ao projeto
            border: Border.all(width: 0, color: Colors.transparent),
            backgroundColor: UpColors.wireframe_white.withAlpha(100),
            onTap: controller.handleNavBarTap,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: controller.getColor(0),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/search.svg',
                  color: controller.getColor(1),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/more-horizontal.svg',
                  color: controller.getColor(2),
                ),
              ),
            ],
          ),
        ));
  }
}
