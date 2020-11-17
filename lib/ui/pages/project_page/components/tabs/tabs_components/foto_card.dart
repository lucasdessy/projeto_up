import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectPageFotoCard extends StatelessWidget {
  final String fotoUrl;

  const ProjectPageFotoCard({Key key, @required this.fotoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 122,
        height: 122,
        margin: EdgeInsets.only(left: 20),
        child: Image.network(
          fotoUrl,
          height: 122,
          width: 122,
          fit: BoxFit.cover,
          errorBuilder: (ctx, obj, stack) {
            return Container(
              color: Colors.grey,
              width: 122,
              height: 122,
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
