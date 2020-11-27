import 'package:flutter/material.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/utils/up_text.dart';

class OnboardingPageSecondPage extends StatelessWidget {
  final void Function() closeOnBoarding;

  const OnboardingPageSecondPage({Key key, @required this.closeOnBoarding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/png/onboarding.png',
            height: 300,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Entre em contato com a equipe para parcerias ou interesse em investir.",
            style: UpText.OnBoardingText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 60,
          ),
          UpButton(
            text: "Começar",
            onTap: closeOnBoarding,
          )
        ],
      ),
    );
  }
}
