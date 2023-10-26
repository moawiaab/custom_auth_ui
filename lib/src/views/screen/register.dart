import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/register_controller.dart';
import '../widgets/texts/text_login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController(authRepository: Get.find()));
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: const Color(0xfff1f1f1),
        body: GetBuilder<RegisterController>(builder: (controller) {
          return CustomForm(
            title: "17".tr,
            statusRequired: controller.statusRequired,
            icon: Icons.lock_outline,
            formKey: controller.formKey,
            bottom: 30,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: BigText(text: "24".tr, maxLine: false , align: TextAlign.center, size: 18),
                ),
                const Divider(),
                CustomTextInput(
                  hintText: "20".tr,
                  icon: Icons.person,
                  controller: controller.nameController,
                  valid: (val) => validInput(val!, isRequire: true, min: 5),
                ),
                CustomTextInput(
                  hintText: "18".tr,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  valid: (val) => validInput(val!, isEmail: true),
                ),
                CustomTextInput(
                  hintText: "21".tr,
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneController,
                  valid: (val) => validInput(val!, isPhone: true),
                ),
                CustomTextInput(
                  hintText: "19".tr,
                  icon: Icons.password_outlined,
                  controller: controller.passwordController,
                  password: controller.showPassword,
                  onTapIcon: controller.changeShowPassword,
                  valid: (val) => validInput(val!, isRequire: true, min: 4, max: 8),
                ),
                const SizedBox(height: 20),

                CustomButton(
                  onPressed: () {
                    controller.register();
                  },
                  icon: Icons.login,
                  text: "17".tr,
                ),
                CustomLoginText(
                    text: "25".tr,
                    text2: "26".tr,
                    onTap: () {
                      Get.offNamed("/login");
                    })
              ],
            ),
          );
        }),
      ),
    );
  }
}
