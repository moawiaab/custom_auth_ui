
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
    Get.put(LoginController());
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: const Color(0xfff1f1f1),
        body: GetBuilder<LoginController>(builder: (controller) {
          return CustomForm(
            formKey: controller.formKey,
            bottom: 50,
            child: Column(
              children: [
                const SizedBox(height: 60),
                CustomTextInput(
                  hintText: "email",
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                ),
                CustomTextInput(
                  hintText: "password",
                  icon: Icons.password_outlined,
                  controller: controller.passwordController,
                  password: controller.showPassword,
                  onTapIcon: controller.changeShowPassword,
                ),
                const SizedBox(height: 20),
                CustomLoginText(
                    text: "forget password", text2: "go to change", onTap: () {}),
                CustomButton(
                  onPressed: () {},
                  icon: Icons.login,
                  text: "login",
                ),
                CustomLoginText(
                    text: "forget password", text2: "go to change", onTap: () {})
              ],
            ),
          );
        }),
      ),
    );
  }
}
