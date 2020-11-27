import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_header_no_sliver.dart';
import 'package:projeto_up/ui/pages/onboarding_page/components/first_page.dart';
import 'package:projeto_up/ui/pages/onboarding_page/components/second_page.dart';
import 'package:projeto_up/ui/pages/onboarding_page/onboarding_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      appBar: UpHeaderNoSliver(
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPageFirstPage(
            goToNextPage: controller.handleGoToNextPage,
          ),
          OnboardingPageSecondPage(
            closeOnBoarding: controller.handleCloseOnBoarding,
          ),
        ],
      ),
    );
  }
}
