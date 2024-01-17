import 'package:custom_auth_ui/src/core/functions/custom_snackbar.dart';
import 'package:custom_auth_ui/src/core/status_require.dart';
import 'package:custom_auth_ui/src/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControllerAbs extends GetxController {
  final AuthRepository authRepository;
  ForgetPasswordControllerAbs({required this.authRepository});
  void changePassword();
  void clearInput();
}

class ForgetPasswordController extends ForgetPasswordControllerAbs {
  StatusRequired statusRequired = StatusRequired.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordController({required super.authRepository});

  @override
  Future<void> changePassword({String? deviceName = "test-app"}) async {
    var formState = formKey.currentState;
    try {
      if (formState!.validate()) {
        statusRequired = StatusRequired.loading;
        update();
        Response response =
            (await authRepository.forgetPassword(emailController.text));
        if (response.statusCode == 200) {
          clearInput();
          Get.offNamed("/login");
        } else {
          customSnackbar(response.body['message']);
        }
        statusRequired = StatusRequired.none;
      } else {
        customSnackbar("اكمل الحقول من فضلك",
            color: Colors.yellowAccent, title: "تنبيه!");
      }
    } catch (e) {
      customSnackbar(e.toString());
      statusRequired = StatusRequired.none;
    }
    update();
  }

  @override
  void onInit() {
    // emailController.text = "admin@admin.com";
    super.onInit();
  }

  @override
  void clearInput() {
    emailController.text = "";
  }
}
