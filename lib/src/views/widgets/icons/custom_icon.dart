import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.bColor,
    this.iconSize = 120,
    this.textSize,
    this.iconColor =  Colors.black54,
    this.textColor,
    this.icon = Icons.format_list_bulleted
  });
  final IconData? icon;
  final Color? bColor;
  final double? iconSize;
  final double? textSize;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bColor),
      child: Column(
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          Text(
            "login page",
            style: TextStyle(
                fontSize: textSize ?? iconSize! / 4,
                fontWeight: FontWeight.bold, color: textColor ?? iconColor),
          )
        ],
      ),
    );
  }
}
