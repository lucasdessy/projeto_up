// Essa e uma classe simples, a qual vai conter constantes que
// armazenam os caminhos para as paginas, assim como armazenar
// a propria lista de paginas, a qual o app usara para a navegacao

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_bloc.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_view.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_view.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_nontab.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_tab.dart';
import 'package:projeto_up/ui/pages/search_tab/search_tab_view.dart';
import 'package:projeto_up/ui/pages/simple_splash_page/simple_splash_page_view.dart';
import 'package:projeto_up/ui/pages/splash_page/splash_page_view.dart';

class RouterService {
  // Paginas novas serao adicionadas aqui,
  // Conforme necessario.
  static const String SIMPLE_SPLASH = '/simple-splash';
  static const String SPLASH = '/splash';
  static const String HOME = '/';

  final List<GetPage> pages = [
    GetPage(
      name: SIMPLE_SPLASH,
      page: () => SimpleSplashPageView(),
    ),
    GetPage(
      name: SPLASH,
      page: () => SplashPageView(),
    ),
    GetPage(
      name: HOME,
      page: () => HomePageView(),
      binding: HomePageBindings(),
    ),
    GetPage(
      name: PROJECTS + ":startupId",
      page: () => ProjectPageNonTab(),
    ), //URL Dinamica para ser tratada no nested navigator
  ];

  //Usado pelo nested navigator
  static const String HOME_TAB = '/home';
  static const String SEARCH_TAB = '/search';
  static const String MY_PROFILE_TAB = '/my-profile';
  static const String PROJECTS = '/projects/';

  // ignore: missing_return
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //URL estaticas
    switch (settings.name) {
      case HOME_TAB:
        return GetPageRoute(
          settings: settings,
          page: () => HomeTabView(),
        );
      case SEARCH_TAB:
        return GetPageRoute(
          settings: settings,
          page: () => SearchTabView(),
        );
      case MY_PROFILE_TAB:
        return GetPageRoute(
          settings: settings,
          page: () => ProjectPageTab(),
        );
    }

    // Urls dinamicas
    if (settings.name.startsWith(PROJECTS)) {
      return generateRouteGet(settings);
    }
  }

  //copy pasta
  static GetPageRoute generateRouteGet(RouteSettings settings) {
    final match = Get.routeTree.matchRoute(settings.name);
    Get.parameters = match?.parameters;
    return GetPageRoute(
      page: match.route.page,
      parameter: match.route.parameter,
      settings:
          RouteSettings(name: settings.name, arguments: settings.arguments),
      curve: match.route.curve,
      opaque: match.route.opaque,
      customTransition: match.route.customTransition,
      binding: match.route.binding,
      bindings: match.route.bindings,
      transitionDuration:
          (match.route.transitionDuration ?? Get.defaultTransitionDuration),
      transition: match.route.transition,
      popGesture: match.route.popGesture,
      fullscreenDialog: match.route.fullscreenDialog,
    );
  }
}
