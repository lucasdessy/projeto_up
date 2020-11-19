import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_colors.dart';

class BlankHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: UpColors.wireframe_darkest),
      centerTitle: true,
      toolbarHeight: 87,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(87);
}
