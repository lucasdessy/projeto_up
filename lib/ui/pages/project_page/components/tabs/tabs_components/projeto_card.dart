import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/projeto_details_page.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageProjetoCard extends StatelessWidget {
  final Projeto projeto;
  const ProjectPageProjetoCard({Key key, @required this.projeto})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 110,
        width: 163,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Hero(
                  tag: projeto.id,
                  child: Image.network(
                    projeto.capaUrl,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, obj, stack) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                      ); // Gera quando nao consegue carregar a imagem
                    },
                    loadingBuilder: (ctx, wdg, evt) {
                      if (evt == null) return wdg;
                      return Center(
                          child:
                              CupertinoActivityIndicator()); // Gera quando esta carregando a imagem
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(30, 0, 0, 0),
                      Color.fromARGB(120, 0, 0, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 11, bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projeto.nomeProjeto,
                          style: UpText.SearchCardTitle,
                        ),
                        Text(
                          "Projeto",
                          style: UpText.SearchCardSubtitle,
                        )
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 11, bottom: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 18,
                        child: Center(
                          child: Text(
                            "3K",
                            style: UpText.SearchCardViewCount,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(
                        'assets/svg/fire.svg',
                        color: UpColors.wireframe_white,
                        height: 18,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  type: MaterialType.transparency,
                  elevation: 0,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProjectPageProjetoDetailsPage(
                              projeto: projeto,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
