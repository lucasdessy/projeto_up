import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/user_service.dart';

class LogInPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LogInPageController());
  }
}

class LogInPageController extends GetxController {
  final UserService userService = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void handleFacebookSignIn() {}

  void handleGoogleSignIn() {
    userService.signInWithGoogle();
  }

  void handleForgotPassword() async {
    if (emailController.text.trim().isEmail) {
      try {
        await userService.forgotPassword(email: emailController.text);
        Get.snackbar(
            "Sucesso ao resetar a senha", "Cheque sua caixa de entrada");
      } catch (e) {
        Get.snackbar("Falha ao resetar a senha", e.toString());
      }
    } else {
      Get.snackbar("Para resetar a senha", "Digite um email válido");
    }
  }

  Future<void> handleLogIn() async {
    if (formKey.currentState.validate()) {
      try {
        await userService.signIn(
            email: emailController.text, pass: passController.text);
        Get.until((route) => route.isFirst);
      } catch (e) {
        Get.snackbar("Falha ao realizar login", e.toString());
      }
    }
  }

  void handleSignUp() {
    Get.toNamed(RouterService.SIGN_UP);
  }
}
