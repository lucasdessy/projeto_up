import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageMembroCard extends StatelessWidget {
  final Membro membro;

  const ProjectPageMembroCard({Key key, @required this.membro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 61,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/linha.svg'),
          SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.network(
              membro.fotoUrl ?? "",
              height: 51,
              fit: BoxFit.cover,
              errorBuilder: (ctx, obj, stack) {
                return Container(
                  color: Colors.grey,
                  width: 40,
                  height: 40,
                ); // Gera quando nao consegue carregar a imagem
              },
              loadingBuilder: (ctx, wdg, evt) {
                if (evt == null) return wdg;
                return Center(
                  child: CupertinoActivityIndicator(),
                ); // Gera quando esta carregando a imagem
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${membro.nomeMembro}",
                style: UpText.ProjectPageTitleBold,
              ),
              Text(
                "${membro.cargo}",
                style: UpText.ProjectPageDesc,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
