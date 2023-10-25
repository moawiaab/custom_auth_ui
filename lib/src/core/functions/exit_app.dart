import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("conform"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("console"),
      ),
    ],
  );
  return Future.value(false);
}
