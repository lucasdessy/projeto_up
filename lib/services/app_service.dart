// Essa classe gerencia as features gerais do app, como
// ir para a home depois do splash, e mostrar o onboarding
// pela primeira vez, alem de iniciar os outros servicos.

import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/user_service.dart';
import 'package:projeto_up/utils/up_config.dart';

class AppService extends GetxService {
  // TODO show onboarding

  @override
  void onInit() {
    Get.put(UserService());
    Get.put(StartupService());

    super.onInit();
  }

  @override
  void onReady() async {
    await Future.delayed(
      Duration(seconds: UpConfig.SPLASH_TIME),
    );
    Get.offAllNamed(RouterService.HOME);
    super.onReady();
  }
}
