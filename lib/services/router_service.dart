// Essa e uma classe simples, a qual vai conter constantes que
// armazenam os caminhos para as paginas, assim como armazenar
// a propria lista de paginas, a qual o app usara para a navegacao

import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_bloc.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_view.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_nontab.dart';
import 'package:projeto_up/ui/pages/simple_splash_page/simple_splash_page_view.dart';
import 'package:projeto_up/ui/pages/splash_page/splash_page_view.dart';

class RouterService {
  // Paginas novas serao adicionadas aqui,
  // Conforme necessario.
  static const String SIMPLE_SPLASH = '/simple-splash';
  static const String SPLASH = '/splash';
  static const String HOME = '/';
  static const String PROJECTS = '/projects/'; // Recebe startupId
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
    ),
  ];
}
