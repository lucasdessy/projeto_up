// Essa e uma classe simples, a qual vai conter constantes que
// armazenam os caminhos para as paginas, assim como armazenar
// a propria lista de paginas, a qual o app usara para a navegacao

import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_bloc.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_view.dart';
import 'package:projeto_up/ui/pages/splash_page/splash_page_view.dart';

class RouterService {
  // Paginas novas serao adicionadas aqui,
  // Conforme necessario.
  static const String SPLASH = '/splash';
  static const String HOME = '/';

  final List<GetPage> pages = [
    GetPage(
      name: SPLASH,
      page: () => SplashPageView(),
    ),
    GetPage(
      name: HOME,
      page: () => HomeTabView(),
      binding: HomeTabBindings(),
    ),
  ];
}
