// Essa classe contem os estilos dos textos.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpText {
  static const Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static const BoldWhite = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const Segment = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 156, 168, 170),
  );
  static const StartupCardTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 15, 0, 49),
  );
  static const StartupCardSubtitle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 155, 144, 177),
  );
  static const StartupCardViewCount = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 82, 29, 195),
  );
}
