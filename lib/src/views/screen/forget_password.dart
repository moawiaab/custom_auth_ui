import 'package:custom_auth_ui/src/controllers/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_auth_ui.dart';
import '../widgets/texts/text_login.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController(authRepository: Get.find()));
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: const Color(0xfff1f1f1),
        body: GetBuilder<ForgetPasswordController>(builder: (controller) {
          return CustomForm(
            title: "14".tr,
            statusRequired: controller.statusRequired,
            icon: Icons.lock_outline,
            formKey: controller.formKey,
            bottom: Dimensions.height30,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height50),
                  child: BigText(
                      text: "39".tr,
                      maxLine: false,
                      align: TextAlign.center,
                      size: 18),
                ),
                const Divider(),
                SizedBox(height: Dimensions.height20),
                CustomTextInput(
                  hintText: "18".tr,
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                  valid: (val) => validInput(val!, isEmail: true),
                ),
                SizedBox(height: Dimensions.height10),
                CustomButton(
                  onPressed: () {
                    controller.changePassword();
                  },
                  icon: Icons.login,
                  text: "15".tr,
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height30),
                  child: BigText(
                      text: "40".tr,
                      maxLine: false,
                      size: Dimensions.fontSize16),
                ),
                const Divider(),
                CustomLoginText(
                    text: "31".tr,
                    text2: "9".tr,
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
