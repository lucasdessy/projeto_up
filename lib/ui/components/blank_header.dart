import 'package:flutter/material.dart';
import 'package:projeto_up/ui/components/up_back_button.dart';
import 'package:projeto_up/utils/up_colors.dart';

class BlankHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: UpColors.wireframe_darkest),
      centerTitle: true,
      toolbarHeight: 87,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: canPop ? UpBackButton() : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(87);
}
