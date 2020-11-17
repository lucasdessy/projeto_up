import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/project_page/components/at_a_glance_card.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/contato_tab.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/home_tab.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/portfolio_tab.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ProjectPageView extends StatefulWidget {
  final ProjectPageController controller;

  const ProjectPageView({Key key, @required this.controller}) : super(key: key);

  @override
  _ProjectPageViewState createState() => _ProjectPageViewState();
}

class _ProjectPageViewState extends State<ProjectPageView>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int currentIndex = 0;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      if (currentIndex != controller.index) {
        setState(() {
          currentIndex = controller.index;
        });
      }
    });
    super.initState();
  }

  Color getColor(int index) {
    final Color activeColor = Color.fromARGB(255, 54, 1, 168);
    final Color inactiveColor = Color.fromARGB(255, 255, 255, 255);
    if (index == currentIndex) return activeColor;
    return inactiveColor;
  }

  void animateTo(int index) {
    controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        headerSliverBuilder: (ctx, isScrolled) {
          return [
            UpHeader(),
            Obx(
              () => widget.controller.loading
                  ? SliverToBoxAdapter(
                      child: Container(),
                    )
                  : SliverToBoxAdapter(
                      child: ProjectPageAtAGlanceCard(
                        startup: widget.controller.startup,
                        getColor: getColor,
                        animateTo: animateTo,
                      ),
                    ),
            )
          ];
        },
        body: Obx(
          () => TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              if (widget.controller.loading) ...[
                Center(
                  child: CupertinoActivityIndicator(),
                ),
                Center(
                  child: CupertinoActivityIndicator(),
                ),
                Center(
                  child: CupertinoActivityIndicator(),
                ),
              ] else ...[
                ProjectPageHomeTab(
                  startup: widget.controller.startup,
                ),
                ProjectPagePortfolioTab(),
                ProjectPageContatoTab(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
