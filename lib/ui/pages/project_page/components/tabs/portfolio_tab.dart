import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/components/slide_up_route.dart';
import 'package:projeto_up/ui/components/up_add_button.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projects_listing.dart';

class ProjectPagePortfolioTab extends StatefulWidget {
  final List<Projeto> projetos;
  final bool isPersonal;
  final void Function() handleAddProject;

  ProjectPagePortfolioTab({
    Key key,
    @required this.projetos,
    @required this.isPersonal,
    @required this.handleAddProject,
  }) : super(key: key);

  @override
  _ProjectPagePortfolioTabState createState() =>
      _ProjectPagePortfolioTabState();
}

class _ProjectPagePortfolioTabState extends State<ProjectPagePortfolioTab> {
  HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
  }

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return (widget?.projetos?.length ?? 0) == 0
        ? Padding(
            padding: EdgeInsets.only(left: 87, right: 87, top: 35),
            child: Column(
              children: [
                Image.asset('assets/png/portfolio.png'),
                widget.isPersonal
                    ? UpAddButton(
                        text: "Adicionar Projetos",
                        onTap: widget.handleAddProject,
                      )
                    : Container()
              ],
            ),
          )
        : ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(
              height: (MediaQuery.of(context).size.height - 262).isNegative
                  ? MediaQuery.of(context).size.height
                  : (MediaQuery.of(context).size.height - 262),
            ),
            child: Navigator(
              observers: [_heroController],
              onGenerateInitialRoutes: (NavigatorState state, String text) {
                return [
                  SlideUpRoute(
                    page: ProjectPageProjectsListing(
                      projetos: widget.projetos,
                    ),
                  )
                ];
              },
            ),
          );
  }
}
