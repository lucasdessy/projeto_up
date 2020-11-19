import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/blank_header.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/authentication_pages/sign_up_page/sign_up_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlankHeader(),
      backgroundColor: UpColors.wireframe_white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/svg/up!.svg',
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 117,
              ),
              UpLabeledTextField(
                controller: controller.emailController,
                topLabel: "Email",
                icon: SvgPicture.asset('assets/svg/mail.svg'),
              ),
              SizedBox(
                height: 20,
              ),
              UpLabeledTextField(
                controller: controller.passController,
                topLabel: "Senha",
                icon: SvgPicture.asset('assets/svg/lock.svg'),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              UpButton(
                text: "Confirmar",
                onTap: controller.handleSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
