import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectPageFotoCard extends StatelessWidget {
  final String fotoUrl;

  const ProjectPageFotoCard({Key key, @required this.fotoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          fotoUrl,
          height: 120,
          width: 120,
          fit: BoxFit.cover,
          errorBuilder: (ctx, obj, stack) {
            print(stack);
            return Container(
              color: Colors.grey,
              width: 120,
              height: 120,
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
    );
  }
}
