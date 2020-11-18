import 'package:flutter/material.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/foto_card.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/membro_card.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageHomeTab extends StatelessWidget {
  final Startup startup;

  const ProjectPageHomeTab({Key key, @required this.startup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição",
                  style: UpText.ProjectPageTitle,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 30),
                  child: Text(
                    "${startup.descricao}",
                    style: UpText.ProjectPageDesc,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 13),
                  child: Text(
                    "Equipe",
                    style: UpText.ProjectPageTitle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 61,
            child: Padding(
              padding: EdgeInsets.only(top: 23),
              child: ListView.builder(
                // itemExtent: 185,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: startup?.membros?.length ?? 0,
                itemBuilder: (ctx, idx) {
                  Membro _membro = startup.membros[idx];
                  return ProjectPageMembroCard(membro: _membro);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 13, left: 20),
            child: Text(
              "Álbum",
              style: UpText.ProjectPageTitle,
            ),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: EdgeInsets.only(top: 23),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: startup?.album?.length ?? 0,
                itemBuilder: (ctx, idx) {
                  String _fotoUrl = startup.album[idx];
                  return ProjectPageFotoCard(
                    fotoUrl: _fotoUrl,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
