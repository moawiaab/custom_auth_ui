import 'package:flutter/material.dart';

import 'big_text.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.fontWeight = false,
    this.textColor = Colors.black87,
    this.alignment = MainAxisAlignment.start,
    this.iconColor = Colors.grey
  });
  final String text;
  final IconData icon;
  final bool? fontWeight;
  final Color? textColor;
  final MainAxisAlignment? alignment;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: alignment!,
      children: [
        const SizedBox(
          width: 5,
        ),
        Icon(icon, color: iconColor),
        BigText(text: text, fontWeight: fontWeight, textColor: textColor),
      ],
    );
  }
}
