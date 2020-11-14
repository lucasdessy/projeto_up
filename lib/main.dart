import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/app.dart';
import 'package:projeto_up/services/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServices();
  runApp(App());
}

void initializeServices() {
  Get.put(UserService());
}
