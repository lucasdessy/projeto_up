import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/ui/components/up_back_button.dart';
import 'package:projeto_up/utils/up_colors.dart';

class UpHeader extends StatelessWidget {
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  const UpHeader({Key key, this.actions, this.automaticallyImplyLeading = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: automaticallyImplyLeading
          ? canPop
              ? UpBackButton()
              : null
          : null,
      centerTitle: true,
      expandedHeight: 87,
      toolbarHeight: 87,
      actions: actions,
      iconTheme: IconThemeData(color: UpColors.appbar_icons),
      title: SvgPicture.asset(
        'assets/svg/up!.svg',
        height: 35,
        alignment: Alignment.center,
      ),
    );
  }
}
