import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 63,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: SvgPicture.asset(
        'assets/svg/up!.svg',
        alignment: Alignment.center,
      ),
    );
  }
}
