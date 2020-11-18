import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageOutrosContatos extends StatelessWidget {
  final List<String> contatos;
  final void Function(String) onTap;

  const ProjectPageOutrosContatos(
      {Key key, @required this.contatos, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: contatos.length,
      itemBuilder: (ctx, idx) {
        return GestureDetector(
          onTap: () => onTap(contatos[idx]),
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            child: Text(
              "${contatos[idx]}",
              style: UpText.ProjectPageLink,
            ),
          ),
        );
      },
    );
  }
}
