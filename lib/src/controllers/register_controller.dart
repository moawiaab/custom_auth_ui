import 'package:custom_auth_ui/src/core/functions/custom_snackbar.dart';
import 'package:custom_auth_ui/src/core/status_require.dart';
import 'package:custom_auth_ui/src/data/models/register_model.dart';
import 'package:custom_auth_ui/src/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterControllerAbs extends GetxController {
  final AuthRepository authRepository;
  RegisterControllerAbs({required this.authRepository});
  void register();
  void changeShowPassword();
  void clearInput();
}

class RegisterController extends RegisterControllerAbs {
  StatusRequired statusRequired = StatusRequired.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPassword = true;

  RegisterController({required super.authRepository});

  @override
  Future<void> register({String? deviceName = "test-app"}) async {
    var formState = formKey.currentState;
    try {
      if (formState!.validate()) {
        statusRequired = StatusRequired.loading;
        update();
        Response response = await authRepository.register(RegisterModel(
          name: nameController.text,
          phone: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          deviceName: deviceName,
        ));
        print(response.body);
        if (response.statusCode == 200) {
          var userData = response.body['user'];
          clearInput();
          authRepository.saveUserData(
              email: userData['email'],
              name: userData['name'],
              phone: userData['phone']);
          authRepository.saveToken(response.body['token']);
          Get.offNamed("/");
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
  void changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  @override
  void onInit() {
    emailController.text = "admin@admin.com";
    passwordController.text = "password";
    super.onInit();
  }

  @override
  void clearInput() {
    emailController.text = "";
    passwordController.text = "";
  }
}
