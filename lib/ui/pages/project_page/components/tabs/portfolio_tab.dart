import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projeto_card.dart';

class ProjectPagePortfolioTab extends StatelessWidget {
  final List<Projeto> projetos;

  const ProjectPagePortfolioTab({Key key, @required this.projetos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO fazer pagina de detalhes (possivelmente com navegador extra)
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: projetos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 110,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, idx) {
          return ProjectPageProjetoCard(
            projeto: projetos[idx],
            onTap: (Projeto _projeto) {},
          );
        },
      ),
    );
  }
}
