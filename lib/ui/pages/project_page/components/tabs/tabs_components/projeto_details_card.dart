import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageProjetoDetailsCard extends StatelessWidget {
  final Projeto projeto;

  const ProjectPageProjetoDetailsCard({Key key, @required this.projeto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 153,
        width: 335,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Hero(
                tag: "${projeto.id}-image",
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
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
              Hero(
                tag: "${projeto.id}-gradient",
                child: Container(
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
              ),
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "${projeto.id}-viewCount",
                  child: Container(
                    margin: EdgeInsets.only(right: 11, top: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 18,
                          child: Center(
                            child: Text(
                              "${projeto.visualizacoes}",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
