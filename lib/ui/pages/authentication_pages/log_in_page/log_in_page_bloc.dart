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

  void handleFacebookSignIn() {}
  void handleGoogleSignIn() {}
  void handleForgotPassword() {}
  void handleLogIn() {}
  void handleSignUp() {
    Get.toNamed(RouterService.SIGN_UP);
  }
}
