import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  void login();
  void changeShowPassword();
}

class LoginController extends LoginControllerAbs {

  final GlobalKey formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late bool showPassword = false;

  @override
  void login() {
  }

  @override
  void changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

}