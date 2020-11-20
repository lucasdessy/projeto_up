import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_colors.dart';

class UpEditAppBar extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const UpEditAppBar({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      toolbarHeight: 60,
      backgroundColor: UpColors.wireframe_white,
      iconTheme: IconThemeData(color: UpColors.appbar_icons),
      title: Text(
        "$text",
        style: TextStyle(color: Colors.black),
      ),
      pinned: true,
    );
  }
}
