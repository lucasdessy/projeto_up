import 'package:flutter/material.dart';

class HomeTabGreetings extends StatelessWidget {
  // Isso foi dificil
  final Shader gradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 16, 16, 16),
      Color.fromARGB(255, 35, 0, 109),
    ],
    stops: [0, 0.4],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 248, 60.0));
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 248,
        height: 60,
        margin: EdgeInsets.only(left: 20, top: 8),
        child: Text(
          "Olá,"
          "\nseja bem-vinda ao up!",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              foreground: Paint()..shader = gradient),
        ),
      ),
    );
  }
}
