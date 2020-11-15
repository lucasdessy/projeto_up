import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_bloc.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_view.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => CupertinoTabScaffold(
          tabBuilder: (context, index) {
            switch (controller.activeIndex()) {
              case 0:
                return HomeTabView();
              case 1:
                return HomeTabView();
              case 2:
                return HomeTabView();
              default:
                return Container(); // Isso nao deve acontecer
            }
          },
          tabBar: CupertinoTabBar(
            border: Border.all(width: 0, color: Colors.transparent),
            backgroundColor: Colors.transparent,
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
