// Essa classe gerencia as features gerais do app, como
// ir para a home depois do splash, e mostrar o onboarding
// pela primeira vez, alem de iniciar os outros servicos.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/projects_service.dart';
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
    Get.put(ProjectsService());
    super.onInit();
  }

  @override
  void onReady() async {
    // Coloca todas imagens em cache para que nao haja bugs visuais
    await Future.wait([
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/fire.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/home.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/more-horizontal.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/search.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/up!.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/align-left.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/book-open.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/dot.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/facebook.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/instagram.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/phone.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/linha.svg'),
          null),
      precacheImage(AssetImage('assets/png/foguete.png'), Get.context),
      precacheImage(AssetImage('assets/png/stars.png'), Get.context),
      precacheImage(AssetImage('assets/png/whatsapp.png'), Get.context),
    ]);
    Get.offAllNamed(RouterService.SPLASH);

    await Future.delayed(
      Duration(seconds: UpConfig.SPLASH_TIME),
    );
    Get.offAllNamed(RouterService.HOME);

    super.onReady();
  }
}
