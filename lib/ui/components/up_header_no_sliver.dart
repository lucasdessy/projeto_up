import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/ui/components/up_back_button.dart';
import 'package:projeto_up/utils/up_colors.dart';

class UpHeaderNoSliver extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  const UpHeaderNoSliver(
      {Key key, this.actions, this.automaticallyImplyLeading = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
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
      actions: actions,
      automaticallyImplyLeading: false,
      leading: automaticallyImplyLeading
          ? canPop
              ? UpBackButton()
              : null
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(87);
}
