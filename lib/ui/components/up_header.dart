import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_up/utils/up_colors.dart';

class UpHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      expandedHeight: 87,
      toolbarHeight: 87,
      iconTheme: IconThemeData(color: UpColors.wireframe_darkest),
      title: SvgPicture.asset(
        'assets/svg/up!.svg',
        height: 35,
        alignment: Alignment.center,
      ),
    );
  }
}
