import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_icon.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.child,
    this.colors,
    this.formKey,
    this.bottom = 0
  });
  final Widget child;
  final List<Color>? colors;
  final GlobalKey? formKey;
  final double? bottom;

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
                    Colors.red.withOpacity(0.3),
                    Colors.red.withOpacity(0.8),
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
            child: const Column(children: [
              CustomIcon(
                iconSize: 120,
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
      ],
    );
  }
}
