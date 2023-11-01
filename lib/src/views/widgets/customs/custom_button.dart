import 'package:custom_auth_ui/src/core/dimension.dart';
import 'package:flutter/material.dart';
import '../texts/text_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text = "save",
    this.icon = Icons.save,
    this.textColor,
    this.onPressed,
  });
  final String? text;
  final IconData? icon;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.height20, vertical: Dimensions.height20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.height20 * 4),
          boxShadow: [
            BoxShadow(
                blurRadius: 0,
                spreadRadius: 1,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                offset: Offset(
                    Dimensions.fontSize12 / 4, Dimensions.fontSize12 / 2))
          ]),
      child: FilledButton.tonal(
        onPressed: onPressed,
        child: TextWithIcon(
          text: text!,
          textColor: textColor ?? Theme.of(context).primaryColor,
          fontWeight: true,
          icon: icon!,
          alignment: MainAxisAlignment.center,
          iconColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
