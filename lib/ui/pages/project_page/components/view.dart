import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/project_page/components/header.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/contato_tab.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/home_tab.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/portfolio_tab.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/sliver_header_delegate.dart';
import 'package:projeto_up/ui/pages/project_page/project_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ProjectPageView extends StatefulWidget {
  final ProjectPageController controller;
  final bool isPersonal;

  const ProjectPageView({
    Key key,
    @required this.controller,
    @required this.isPersonal,
  }) : super(key: key);

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
    final Color inactiveColor = Color.fromARGB(0, 255, 255, 255);
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
      body: Obx(
        () => SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              UpHeader(
                actions: widget.isPersonal
                    ? [
                        widget.controller.userService.isLoggedIn
                            ? IconButton(
                                icon: Icon(Icons.logout),
                                onPressed: widget.controller.handleLogout)
                            : Container()
                      ]
                    : [],
              ),
              if (widget.controller.loading)
                SliverFillRemaining(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              else ...[
                SliverPersistentHeader(
                  delegate: ProjectPageSliverHeaderDelegate(
                    child: ProjectPageHeader(
                      animateTo: animateTo,
                      getColor: getColor,
                      startup: widget.controller.startup(),
                      isPersonal: widget.isPersonal,
                      handleEditStartup: widget.controller.handleEditStartup,
                    ),
                    maxSize: 275.5,
                    minSize: 275.5,
                  ),
                  pinned: true,
                  // floating: true,
                ),
                SliverToBoxAdapter(
                  child: ListView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 15),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        [
                          ProjectPageHomeTab(
                            startup: widget.controller.startup(),
                            isPersonal: widget.isPersonal,
                            handleAddDesc: widget.controller.handleAddDesc,
                            handleAddEquipe: widget.controller.handleAddEquipe,
                            handleAddImage: widget.controller.handleAddImage,
                          ),
                          ProjectPagePortfolioTab(
                            projetos: widget.controller.projects,
                            isPersonal: widget.isPersonal,
                            handleAddProject:
                                widget.controller.handleAddProject,
                          ),
                          ProjectPageContatoTab(
                            startup: widget.controller.startup(),
                            isPersonal: widget.isPersonal,
                            handleAddContacts:
                                widget.controller.handleAddContacts,
                          ),
                        ][currentIndex],
                      ]),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
