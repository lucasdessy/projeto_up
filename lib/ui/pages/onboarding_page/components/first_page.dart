import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/utils/up_text.dart';

class OnboardingPageFirstPage extends StatelessWidget {
  final void Function() goToNextPage;

  const OnboardingPageFirstPage({Key key, @required this.goToNextPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/png/start.png',
            height: 300,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Encontre as startups e os projetos mais tops do momento.",
            style: UpText.OnBoardingText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: goToNextPage,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Próximo",
                    style: UpText.OnBoardingNextText,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  SvgPicture.asset('assets/svg/arrow-right.svg')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
