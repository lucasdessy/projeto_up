import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/authentication_pages/not_logged_page/not_logged_page_view.dart';
import 'package:projeto_up/ui/pages/project_page/components/view.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';

class ProjectPageMyProfile extends StatelessWidget {
  final ProjectPageController controller = Get.find(tag: "myProfile");
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.canDisplay
        ? ProjectPageView(
            controller: controller,
            isPersonal: true,
          )
        : NotLoggedPageView());
  }
}
