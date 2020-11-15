import 'package:flutter/material.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/project_page/components/at_a_glance_card.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';

class ProjectPageView extends StatelessWidget {
  final ProjectPageController controller;

  const ProjectPageView({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          UpHeader(),
          ProjectPageAtAGlanceCard(),
        ],
      ),
    );
  }
}
