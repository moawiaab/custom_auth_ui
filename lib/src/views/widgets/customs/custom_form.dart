import 'package:custom_auth_ui/src/core/status_require.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_input_and_icon.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.child,
    this.colors,
    this.formKey,
    this.bottom = 0,
    this.icon = Icons.format_list_bulleted,
    required this.statusRequired, required this.title,
  });
  final Widget child;
  final List<Color>? colors;
  final GlobalKey<FormState>? formKey;
  final double? bottom;
  final IconData? icon;
  final StatusRequired statusRequired;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Get.height / 2,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: colors ??
                  [
                    Colors.green.withOpacity(0.3),
                    Colors.greenAccent.withOpacity(0.8),
                    Colors.yellow.withOpacity(0.8),
                    Colors.yellow.withOpacity(0.3)
                  ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 3,
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(children: [
              CustomIcon(
                icon: icon!,
                iconSize: 120,
                iconColor: Colors.green,
                text: title,
              )
            ]),
          ),
        ),
        SizedBox(
          height: Get.height,
          width: Get.width,
        ),
        Positioned(
          top: Get.height / 4.5,
          left: 0,
          right: 0,
          bottom: bottom!,
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                  )
                ]),
            child: SingleChildScrollView(
              child: Form(key: formKey, child: child),
            ),
          ),
        ),
        statusRequired == StatusRequired.loading
            ? Positioned(
                top: Get.height / 4.5,
                left: 0,
                right: 0,
                bottom: bottom,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.3)),
                  child: const Center(
                      child: Image(
                    image: AssetImage("assets/images/loading.gif"),
                  )),
                ),
              )
            : Container()
      ],
    );
  }
}
