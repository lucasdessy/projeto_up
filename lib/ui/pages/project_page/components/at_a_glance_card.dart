import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageAtAGlanceCard extends StatelessWidget {
  final Startup startup;

  const ProjectPageAtAGlanceCard({
    Key key,
    @required this.startup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 208.5,
      decoration: BoxDecoration(
        color: UpColors.wireframe_white,
      ),
      child: Stack(
        children: [
          Container(
            height: 152,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                  image: NetworkImage(startup.capaUrl ?? ""),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 13,
            top: 118,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: UpColors.wireframe_white,
                  image: DecorationImage(
                      image: NetworkImage(startup.capaUrl ?? ""),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                  border:
                      Border.all(color: UpColors.wireframe_white, width: 3)),
            ),
          ),
          Positioned(
            top: 164,
            left: 125,
            child: Container(
              height: 38,
              width: 185,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${startup.nome}",
                        style: UpText.StartupProjectCardName,
                      ),
                      Text(
                        "${startup.segmento}",
                        style: UpText.StartupProjectCardSubtitle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: Image.asset('assets/png/whatsapp.png'),
                      ),
                      SizedBox(
                        width: 17,
                        height: 17,
                      ),
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: SvgPicture.asset('assets/svg/facebook.svg'),
                      ),
                      SizedBox(
                        width: 17,
                        height: 17,
                      ),
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: SvgPicture.asset('assets/svg/instagram.svg'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
