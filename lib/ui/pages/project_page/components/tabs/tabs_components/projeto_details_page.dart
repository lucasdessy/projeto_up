import 'package:flutter/material.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/components/up_back_button.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projeto_details_card.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageProjetoDetailsPage extends StatelessWidget {
  final Projeto projeto;

  const ProjectPageProjetoDetailsPage({
    Key key,
    @required this.projeto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpBackButton(),
              Center(
                child: ProjectPageProjetoDetailsCard(projeto: projeto),
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: "${projeto.id}-title",
                child: Container(
                  width: double.infinity,
                  child: Text(
                    projeto.nomeProjeto,
                    style: UpText.ProjectDetailsTitle,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  projeto.descricao,
                  style: UpText.ProjectDetailsDesc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
