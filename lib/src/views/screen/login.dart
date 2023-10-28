import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_auth_ui.dart';
import '../../controllers/login_controller.dart';
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
            title: "10".tr,
            statusRequired: controller.statusRequired,
            icon: Icons.lock_outline,
            formKey: controller.formKey,
            bottom: Dimensions.height30,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.height50),
                  child: BigText(text: "11".tr, maxLine: false , align: TextAlign.center, size: Dimensions.fontSize18),
                ),
                const Divider(),
                SizedBox(height: Dimensions.height20),
                CustomTextInput(
                  hintText: "18".tr,
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                  valid: (val) => validInput(val!, isEmail: true),
                ),
                CustomTextInput(
                  hintText: "19".tr,
                  icon: Icons.password_outlined,
                  controller: controller.passwordController,
                  password: controller.showPassword,
                  onTapIcon: controller.changeShowPassword,
                  valid: (val) => validInput(val!, isRequire: true, min: 4, max: 8),
                ),
                 SizedBox(height: Dimensions.height20),
                CustomLoginText(
                    text: "14".tr,
                    text2: "15".tr,
                    onTap: () {
                      Get.offNamed("/forget_password");
                    }),
                CustomButton(
                  onPressed: () {
                    controller.login();
                  },
                  icon: Icons.login,
                  text: "9".tr,
                ),
                CustomLoginText(
                    text: "16".tr,
                    text2: "17".tr,
                    onTap: () {
                      Get.offNamed("/register");
                    })
              ],
            ),
          );
        }),
      ),
    );
  }
}
