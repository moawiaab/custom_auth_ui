import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.size = 20,
    this.fontWeight = false,
    this.textColor = Colors.black87,
    this.maxLine = true,
  });
  final String text;
  final double? size;
  final bool? fontWeight;
  final Color? textColor;
  final bool? maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:5),
      margin: const EdgeInsets.all(5),
      child: Text(
        text,
        maxLines: maxLine! ? 1 : null,
        overflow: maxLine! ? TextOverflow.ellipsis : TextOverflow.clip,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal,
          color: textColor,
        ),
      ),
    );
  }
}
