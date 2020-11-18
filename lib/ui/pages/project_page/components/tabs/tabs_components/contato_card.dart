import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjectPageContatoCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final void Function() onTap;

  const ProjectPageContatoCard({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 44,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(
              width: 11.67,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: UpText.ProjectPageTitleBold,
                ),
                Text(
                  subtitle,
                  style: UpText.ProjectPageDesc2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
