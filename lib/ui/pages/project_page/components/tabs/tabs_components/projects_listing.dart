import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projeto_card.dart';

class ProjectPageProjectsListing extends StatelessWidget {
  final List<Projeto> projetos;

  const ProjectPageProjectsListing({
    Key key,
    @required this.projetos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: projetos.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 110,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, idx) {
          Projeto _projeto = projetos[idx];
          return ProjectPageProjetoCard(
            projeto: _projeto,
          );
        },
      ),
    );
  }
}
