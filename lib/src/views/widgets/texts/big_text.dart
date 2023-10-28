import 'package:custom_auth_ui/src/core/dimension.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight = false,
    this.textColor = Colors.black87,
    this.maxLine = true, this.align,
  });
  final String text;
  final double? size;
  final bool? fontWeight;
  final Color? textColor;
  final bool? maxLine;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical:Dimensions.width5),
      margin:  EdgeInsets.all(Dimensions.width5),
      child: Text(
        text,
        textAlign: align,
        maxLines: maxLine! ? 1 : null,
        overflow: maxLine! ? TextOverflow.ellipsis : TextOverflow.clip,
        style: TextStyle(
          fontSize: size ?? Dimensions.fontSize20,
          fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal,
          color: textColor,
        ),
      ),
    );
  }
}
