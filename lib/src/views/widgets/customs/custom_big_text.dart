import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class CustomBigText extends StatelessWidget {
  const CustomBigText(
      {super.key,
      required this.text,
      this.size,
      this.fontWeight = false,
      this.textColor = Colors.black45,
      this.maxLine = true,
      this.align,
      this.height = 1.5});
  final String text;
  final double? size;
  final bool? fontWeight;
  final Color? textColor;
  final bool? maxLine;
  final TextAlign? align;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLine! ? 1 : null,
      overflow: maxLine! ? TextOverflow.ellipsis : TextOverflow.clip,
      style: TextStyle(
          fontSize: size ?? Dimensions.fontSize20,
          fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal,
          color: textColor,
          height: height),
    );
  }
}
