import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_text.dart';

class LogInPageSignInWithCard extends StatelessWidget {
  final void Function() faceSignIn;
  final void Function() googleSignIn;

  const LogInPageSignInWithCard(
      {Key key, @required this.faceSignIn, @required this.googleSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(top: 43),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Entrar com",
            style: UpText.LogInWithText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/png/g-button.png',
                  height: 40,
                ),
                onPressed: googleSignIn,
              ),
              IconButton(
                icon: Image.asset(
                  'assets/png/f-button.png',
                  height: 40,
                ),
                onPressed: faceSignIn,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
