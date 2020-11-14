import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      expandedHeight: 87,
      toolbarHeight: 87,
      title: Center(
        child: SvgPicture.asset(
          'assets/svg/up!.svg',
          height: 35,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
