import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/app_service.dart';

class OnboardingPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingPageController());
  }
}

class OnboardingPageController extends GetxController {
  final AppService appService = Get.find();
  final PageController pageController = PageController(initialPage: 0);

  void handleGoToNextPage() {
    pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  void handleCloseOnBoarding() {
    appService.finishOnBoarding();
    Get.back();
  }
}
