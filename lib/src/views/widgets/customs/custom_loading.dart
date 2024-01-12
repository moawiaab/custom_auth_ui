import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      padding: EdgeInsets.all(Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2)),
      child: const Center(
          child: Image(
        image: AssetImage("assets/images/loading.gif"),
      )),
    );
  }
}
