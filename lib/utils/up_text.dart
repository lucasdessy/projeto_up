// Essa classe contem os estilos dos textos.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_up/utils/up_colors.dart';

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

  static const SearchCardTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const SearchCardSubtitle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const SearchCardViewCount = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static const SearchField = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: UpColors.wireframe_regular,
  );
  static const SearchFieldActive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: UpColors.wireframe_lightest,
  );
  static const StartupProjectCardName = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 46, 46, 46),
  );
  static const StartupProjectCardSubtitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
  );

  static const ProjectPageTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 51, 51, 51),
  );
  static const ProjectPageTitleBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 51, 51, 51),
  );
  static const ProjectPageDesc = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
  );
  static const ProjectPageDesc2 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
  );
  static const ProjectPageOtherLinks = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 51, 51, 51),
  );
  static const ProjectPageLink = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
    decoration: TextDecoration.underline,
  );
  static const ProjectDetailsTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  static const ProjectDetailsDesc = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
  );
  static const NotLoggedTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 51, 51, 51),
  );
  static const UpButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const LogInWithText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 102, 102, 102),
  );
  static const InputTopText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 119, 119, 119),
  );
  static const ForgotPasswordText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 155, 144, 177),
    decoration: TextDecoration.underline,
  );
  static const SignUpText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 102, 102, 102),
    decoration: TextDecoration.underline,
  );
  static const WelcomeSubtitleText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 85, 85, 85),
  );
}
