import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.child,
    this.colors,
    this.formKey,
    this.bottom = 0,
    this.icon = Icons.format_list_bulleted,
    required this.statusRequired,
    required this.title,
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
            borderRadius: BorderRadius.circular(Dimensions.height30),
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
            margin: EdgeInsets.only(top: Dimensions.height40),
            child: Column(children: [
              CustomIcon(
                icon: icon!,
                iconSize: Dimensions.height40 * 3,
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
            margin: EdgeInsets.all(Dimensions.height20),
            padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
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
                  margin: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height20),
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
