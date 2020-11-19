import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  // Isso foi dificil
  final double width;
  final double height;
  final String text;

  GradientText({
    Key key,
    @required this.width,
    @required this.height,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 16, 16, 16),
        Color.fromARGB(255, 35, 0, 109),
      ],
      stops: [0, 0.4],
    ).createShader(Rect.fromLTWH(0.0, 0.0, width, height));

    return Container(
      width: width,
      height: height,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            foreground: Paint()..shader = gradient),
      ),
    );
  }
}
