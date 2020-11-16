import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/project_page/components/view.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';

class ProjectPageMyProfile extends StatelessWidget {
  final ProjectPageController controller = Get.find(tag: "myProfile");
  @override
  Widget build(BuildContext context) {
    return ProjectPageView(
      controller: controller,
    );
  }
}
