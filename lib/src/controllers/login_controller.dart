import 'package:custom_auth_ui/src/core/status_require.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  void login();
  void changeShowPassword();
}

class LoginController extends LoginControllerAbs {

  StatusRequired statusRequired = StatusRequired.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late bool showPassword = false;

  @override
  void login() {
    var formState = formKey.currentState;
    if (formState!.validate()) {
      statusRequired = StatusRequired.loading;
      update();
      print("ok");
    } else {
      print("no");
    }

  }

  @override
  void changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  @override
  void onInit() {
    emailController.text = "abc@de.fg";
    super.onInit();
  }
}
