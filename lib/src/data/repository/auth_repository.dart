import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:custom_auth_ui/src/data/models/login_model.dart';
import 'package:custom_auth_ui/src/data/models/register_model.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxService {
  final CustomServices services;
  AuthRepository({required this.services});

  Future<Response> login(LoginModel model) async {
    return await services.api.postData("/login", body: model.toJson());
  }

  Future<Response> register(RegisterModel model) async {
    return await services.api.postData("/register", body: model.toJson());
  }

  Future<Response> forgetPassword(String email) async {
    return await services.api.postData("/password/email", body: {"email" : email});
  }

  saveToken(String token) {
    services.sharedPreferences.setString("token", token);
  }

  saveUserData({required String email, required String name, String? phone}) {
    services.sharedPreferences.setString("userEmail", email);
    services.sharedPreferences.setString("userName", name);
    services.sharedPreferences.setString("userPhone", phone!);
  }


}
