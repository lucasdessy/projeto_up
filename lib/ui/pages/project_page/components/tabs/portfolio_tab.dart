import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/components/slide_up_route.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projects_listing.dart';

class ProjectPagePortfolioTab extends StatefulWidget {
  final List<Projeto> projetos;

  ProjectPagePortfolioTab({
    Key key,
    @required this.projetos,
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
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(
        height: (MediaQuery.of(context).size.height - 262 - 60).isNegative
            ? MediaQuery.of(context).size.height
            : (MediaQuery.of(context).size.height - 262 - 60),
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
