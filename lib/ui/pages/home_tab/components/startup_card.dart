import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class HomeTabStartupCard extends StatelessWidget {
  final Startup startup;
  final Function(String) onTap;
  const HomeTabStartupCard(
      {Key key, @required this.startup, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(60, 0, 0, 0),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Container(
              color: UpColors.wireframe_white,
              width: 193,
              child: Column(
                children: [
                  Image.network(
                    startup.capaUrl,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, obj, stack) {
                      return Container(); // Gera quando nao consegue carregar a imagem
                    },
                    loadingBuilder: (ctx, wdg, evt) {
                      if (evt == null) return wdg;
                      return Center(
                          child:
                              CupertinoActivityIndicator()); // Gera quando esta carregando a imagem
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 11, right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              startup.nome,
                              style: UpText.StartupCardTitle,
                            ),
                            Text(
                              "2020",
                              style: UpText.StartupCardSubtitle,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Center(
                                child: Text(
                                  "300",
                                  style: UpText.StartupCardViewCount,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              'assets/svg/fire.svg',
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Material(
                type: MaterialType.transparency,
                elevation: 0,
                child: Container(
                  height: 175,
                  width: 193,
                  child: InkWell(
                    onTap: () => onTap(startup.id),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
