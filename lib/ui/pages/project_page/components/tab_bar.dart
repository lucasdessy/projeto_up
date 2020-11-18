import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ProjectPageTabBar extends StatelessWidget {
  final Color Function(int) getColor;
  final void Function(int) animateTo;

  const ProjectPageTabBar({
    Key key,
    @required this.getColor,
    @required this.animateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.5,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: UpColors.wireframe_white.withAlpha(100),
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 229, 229, 229),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => animateTo(0),
            child: Container(
              width: 107,
              height: 33.5,
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/align-left.svg',
                    height: 20,
                  ),
                  SvgPicture.asset(
                    'assets/svg/dot.svg',
                    height: 4,
                    color: getColor(0),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => animateTo(1),
            child: Container(
              width: 107,
              height: 33.5,
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/book-open.svg',
                    height: 20,
                  ),
                  SvgPicture.asset(
                    'assets/svg/dot.svg',
                    height: 4,
                    color: getColor(1),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => animateTo(2),
            child: Container(
              width: 107,
              height: 33.5,
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/phone.svg',
                    height: 20,
                  ),
                  SvgPicture.asset(
                    'assets/svg/dot.svg',
                    height: 4,
                    color: getColor(2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
