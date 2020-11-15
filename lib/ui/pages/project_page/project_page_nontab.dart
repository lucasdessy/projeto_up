import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/project_page/components/view.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';

class ProjectPageNonTab extends StatelessWidget {
  final ProjectPageController controller = Get.find(tag: "nonTab");
  @override
  Widget build(BuildContext context) {
    return ProjectPageView(
      controller: controller,
    );
  }
}
