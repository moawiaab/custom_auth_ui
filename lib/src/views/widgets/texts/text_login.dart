import 'package:flutter/material.dart';

import 'big_text.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText(
      {super.key, required this.text, required this.text2, this.onTap});
  final String text;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          BigText(text: text, textColor: Colors.grey, size: 18),
          InkWell(
            onTap: onTap,
            child: BigText(
              text: text2,
              size: 16,
              textColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
