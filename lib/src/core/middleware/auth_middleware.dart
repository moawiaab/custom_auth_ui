import 'package:custom_auth_ui/src/core/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  CustomServices services = Get.find();

  @override
  int get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (services.token.isNotEmpty) {
      // return super.redirect("/");
      return const RouteSettings(name: "/");
    }
    return null;
  }
}
