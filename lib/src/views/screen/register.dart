import 'package:custom_auth_ui/src/core/functions/vaild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../core/functions/exit_app.dart';
import '../widgets/customs/custom_button.dart';
import '../widgets/customs/custom_form.dart';
import '../widgets/inputs/text_input.dart';
import '../widgets/texts/text_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController(authRepository: Get.find()));
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: const Color(0xfff1f1f1),
        body: GetBuilder<LoginController>(builder: (controller) {
          return CustomForm(
            statusRequired: controller.statusRequired,
            icon: Icons.lock_outline,
            formKey: controller.formKey,
            bottom: 30,
            child: Column(
              children: [
                const SizedBox(height: 60),
                CustomTextInput(
                  hintText: "email",
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                  valid: (val) => validInput(val!, isEmail: true),
                ),
                CustomTextInput(
                  hintText: "password",
                  icon: Icons.password_outlined,
                  controller: controller.passwordController,
                  password: controller.showPassword,
                  onTapIcon: controller.changeShowPassword,
                  valid: (val) => validInput(val!, isRequire: true, min: 4, max: 8),
                ),
                const SizedBox(height: 20),
                CustomLoginText(
                    text: "forget password",
                    text2: "go to change",
                    onTap: () {}),
                CustomButton(
                  onPressed: () {
                    controller.login();
                  },
                  icon: Icons.login,
                  text: "login",
                ),
                CustomLoginText(
                    text: "forget password",
                    text2: "go to change",
                    onTap: () {})
              ],
            ),
          );
        }),
      ),
    );
  }
}
