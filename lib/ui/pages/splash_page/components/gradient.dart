import 'package:flutter/material.dart';

class SplashPageGradient extends StatelessWidget {
  final Widget child;

  const SplashPageGradient({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 16, 16, 16),
            Color.fromARGB(255, 35, 0, 109),
          ],
          stops: [0.2, 1],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child,
    );
  }
}
