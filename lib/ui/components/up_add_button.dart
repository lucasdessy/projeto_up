import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/utils/up_text.dart';

class UpAddButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const UpAddButton({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      height: 30,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/plus.svg'),
            SizedBox(
              width: 14,
            ),
            Text(
              text,
              style: UpText.ProjectPageDesc,
            )
          ],
        ),
      ),
    );
  }
}
