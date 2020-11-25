import 'package:flutter/material.dart';
import 'package:projeto_up/ui/components/up_back_button.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

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
      title: Text(
        "$text",
        style: UpText.UpEditAppBarText,
      ),
      leading: UpBackButton(),
      pinned: true,
    );
  }
}
