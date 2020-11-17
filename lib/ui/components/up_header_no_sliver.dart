import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/utils/up_colors.dart';

class UpHeaderNoSliver extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 87,
      elevation: 0,
      iconTheme: IconThemeData(color: UpColors.wireframe_darkest),
      title: SvgPicture.asset(
        'assets/svg/up!.svg',
        height: 35,
        alignment: Alignment.center,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(87);
}
