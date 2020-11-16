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

class ProjectPageView extends StatelessWidget {
  final ProjectPageController controller;

  const ProjectPageView({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: Obx(
        () => CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            UpHeader(),
            if (controller.loading())
              SliverFillRemaining(
                child: Center(child: CupertinoActivityIndicator()),
              )
            else ...[
              ProjectPageAtAGlanceCard(
                startup: controller.startup,
                getColor: controller.getColor,
                animateTo: controller.animateTo,
              ),
              SliverFillRemaining(
                child: PageView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    ProjectPageHomeTab(),
                    ProjectPagePortfolioTab(),
                    ProjectPageContatoTab(),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
