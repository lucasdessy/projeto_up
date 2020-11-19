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

  void handleSignUp() {}
}
