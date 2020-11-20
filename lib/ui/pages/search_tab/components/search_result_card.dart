import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class SearchTabSearchResultCard extends StatelessWidget {
  final dynamic startupOrProject;
  final Function(String) onTap;
  const SearchTabSearchResultCard(
      {Key key, @required this.startupOrProject, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String nome = "";
    String tipo = "";
    String capaUrl = "";
    String startupId;
    int views = 0;
    if (startupOrProject is Startup) {
      Startup _tempStartup = startupOrProject;
      nome = _tempStartup.nome;
      tipo = "Startup";
      capaUrl = _tempStartup.capaUrl;
      startupId = _tempStartup.id;
      views = _tempStartup.visualizacoes;
    } else if (startupOrProject is Projeto) {
      Projeto _tempProjeto = startupOrProject;
      nome = _tempProjeto.nomeProjeto;
      tipo = "Projeto";
      capaUrl = _tempProjeto.capaUrl;
      startupId = _tempProjeto.idStartup;
      views = _tempProjeto.visualizacoes;
    } else {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SizedBox(
        height: 110,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  capaUrl,
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
                          nome,
                          style: UpText.SearchCardTitle,
                        ),
                        Text(
                          tipo,
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
                            "$views",
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
                    height: 110,
                    width: 335,
                    child: InkWell(
                      onTap: () => onTap(startupId),
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
