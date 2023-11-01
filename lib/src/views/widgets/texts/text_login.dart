import 'package:flutter/material.dart';

import '../../../../custom_auth_ui.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText(
      {super.key, required this.text, required this.text2, this.onTap});
  final String text;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      child: Row(
        children: [
          BigText(
              text: text, textColor: Colors.grey, size: Dimensions.fontSize18),
          InkWell(
            onTap: onTap,
            child: BigText(
              text: text2,
              size: Dimensions.fontSize16,
              textColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
