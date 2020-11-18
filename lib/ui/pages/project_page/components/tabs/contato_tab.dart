import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/contato_card.dart';
import 'package:projeto_up/ui/pages/project_page/components/tabs/tabs_components/outros_contatos_card.dart';
import 'package:projeto_up/utils/up_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPageContatoTab extends StatelessWidget {
  final Startup startup;

  const ProjectPageContatoTab({Key key, @required this.startup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !startup.instagram.isNullOrBlank
                ? ProjectPageContatoCard(
                    icon: SvgPicture.asset(
                      'assets/svg/instagram.svg',
                      height: 17,
                    ),
                    title: "Instagram",
                    subtitle: "${startup.instagram}",
                    onTap: () async {
                      if (await canLaunch(startup.instagram)) {
                        launch(startup.instagram);
                      }
                    },
                  )
                : Container(),
            !startup.facebook.isNullOrBlank
                ? ProjectPageContatoCard(
                    icon: SvgPicture.asset(
                      'assets/svg/facebook.svg',
                      height: 17,
                    ),
                    title: "Facebook",
                    subtitle: "${startup.facebook}",
                    onTap: () async {
                      if (await canLaunch(startup.facebook)) {
                        launch(startup.facebook);
                      }
                    },
                  )
                : Container(),
            !startup.instagram.isNullOrBlank
                ? ProjectPageContatoCard(
                    icon: Image.asset(
                      'assets/png/whatsapp.png',
                      height: 17,
                    ),
                    title: "Whatsapp",
                    subtitle: "${startup.whatsapp}",
                    onTap: () async {
                      if (await canLaunch(startup.whatsapp)) {
                        launch(startup.whatsapp);
                      }
                    },
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            if (!startup.outrosContatos.isNullOrBlank) ...[
              Text(
                "Outros links",
                style: UpText.ProjectPageOtherLinks,
              ),
              ProjectPageOutrosContatos(
                contatos: startup.outrosContatos,
                onTap: (String contato) async {
                  if (await canLaunch(contato)) {
                    launch(contato);
                  }
                },
              ),
            ] else
              Container(),
          ],
        ),
      ),
    );
  }
}
