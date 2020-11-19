import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/services/user_service.dart';

class SignUpPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpPageController());
  }
}

class SignUpPageController extends GetxController {
  final UserService userService = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void handleSignUp() async {
    if (formKey.currentState.validate()) {
      try {
        await userService.signUp(
            email: emailController.text, pass: passController.text);
        Get.until((route) => route.isFirst);
      } catch (e) {
        Get.snackbar("Erro ao criar a conta", e.toString());
      }
    }
  }
}
