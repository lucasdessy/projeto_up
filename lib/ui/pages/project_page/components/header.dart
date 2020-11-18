import 'package:flutter/material.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/project_page/components/at_a_glance_card.dart';
import 'package:projeto_up/ui/pages/project_page/components/tab_bar.dart';

class ProjectPageHeader extends StatelessWidget {
  final Color Function(int) getColor;
  final void Function(int) animateTo;
  final Startup startup;

  const ProjectPageHeader(
      {Key key,
      @required this.getColor,
      @required this.animateTo,
      @required this.startup})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectPageAtAGlanceCard(startup: startup),
        ProjectPageTabBar(
          getColor: getColor,
          animateTo: animateTo,
        ),
      ],
    );
  }
}
