import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class SearchTabSearchResultCars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  "hsg",
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
                          "Nome",
                          style: UpText.SearchCardTitle,
                        ),
                        Text(
                          "Startup",
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
                    height: 110,
                    width: 335,
                    child: InkWell(
                      onTap: () {},
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
