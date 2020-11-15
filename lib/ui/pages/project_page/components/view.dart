import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';

class ProjectPageView extends StatelessWidget {
  final ProjectPageController controller;

  const ProjectPageView({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(controller.teste()));
  }
}
