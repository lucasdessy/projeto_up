import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projeto_card.dart';

class ProjectPageProjetoDetailsPage extends StatelessWidget {
  final Projeto projeto;

  const ProjectPageProjetoDetailsPage({
    Key key,
    @required this.projeto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectPageProjetoCard(projeto: projeto);
  }
}
