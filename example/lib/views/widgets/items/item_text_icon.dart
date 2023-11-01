import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemTextWithIcon extends StatelessWidget {
  const ItemTextWithIcon(
      {super.key,
      required this.text,
      this.color,
      this.icon = Icons.format_underline,
      this.onTap,
      this.selected = false});
  final String text;
  final Color? color;
  final IconData? icon;
  final void Function()? onTap;
  final bool? selected;
  @override
  Widget build(BuildContext context) {
    final local = Get.locale!.languageCode;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
        margin: EdgeInsets.only(
            top: Dimensions.height15,
            left: local == "ar" ? Dimensions.height40 : 0,
            right: local == "en" ? Dimensions.height40 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(local == "ar" ? Dimensions.height20 : 0),
            bottomLeft:
                Radius.circular(local == "ar" ? Dimensions.height20 : 0),
            topRight: Radius.circular(local == "en" ? Dimensions.height20 : 0),
            bottomRight:
                Radius.circular(local == "en" ? Dimensions.height20 : 0),
          ),
          color: selected! ? Theme.of(context).primaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 0,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon,
                size: Dimensions.height25,
                color: selected! ? Colors.white : color),
            BigText(text: text, textColor: selected! ? Colors.white : color)
          ],
        ),
      ),
    );
  }
}
