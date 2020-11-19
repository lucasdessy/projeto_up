import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/blank_header.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/authentication_pages/log_in_page/components/sign_in_with_card.dart';
import 'package:projeto_up/ui/pages/authentication_pages/log_in_page/log_in_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class LogInPageView extends GetView<LogInPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlankHeader(),
      backgroundColor: UpColors.wireframe_white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/svg/up!.svg',
                    height: 50,
                    alignment: Alignment.center,
                  ),
                ),
                LogInPageSignInWithCard(
                  faceSignIn: controller.handleFacebookSignIn,
                  googleSignIn: controller.handleGoogleSignIn,
                ),
                UpLabeledTextField(
                  controller: controller.emailController,
                  topLabel: "Email",
                  icon: SvgPicture.asset('assets/svg/mail.svg'),
                  validator: (_text) => GetUtils.isEmail(_text.trim())
                      ? null
                      : "Insira um email válido",
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.passController,
                  topLabel: "Senha",
                  icon: SvgPicture.asset('assets/svg/lock.svg'),
                  obscureText: true,
                  maxLines: 1,
                  validator: (_text) => _text.length >= 6
                      ? null
                      : "Sua senha precisa ter mais de 6 caracteres",
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: controller.handleForgotPassword,
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "esqueceu a senha?",
                      textAlign: TextAlign.end,
                      style: UpText.ForgotPasswordText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                UpButton(
                  text: "Entrar",
                  onTap: controller.handleLogIn,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: controller.handleSignUp,
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "Não possui conta? Cadastrar-se",
                      textAlign: TextAlign.center,
                      style: UpText.SignUpText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
