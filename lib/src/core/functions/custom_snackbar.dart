import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(String message,
    {String? title = "has error", Color? color = Colors.red, int? second = 5}) {
  Get.snackbar(title!, message,
      colorText: color,
      // backgroundColor: color!.withOpacity(0.2),
      duration: Duration(seconds: second!)
      // messageText: BigText(text: "${message} $message $message" , textColor: color),
      );
}
