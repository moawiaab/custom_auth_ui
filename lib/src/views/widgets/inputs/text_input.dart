import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      required this.hintText,
      this.icon = Icons.wrap_text_outlined,
      this.onTapIcon,
      this.suffixIcon,
      this.controller,
      this.autofocus = false,
      this.valid,
      this.onChanged,
      this.enabled = true,
      this.iconColor = Colors.grey,
      this.keyboardType = TextInputType.text,
      this.password = false});
  final String hintText;
  final IconData? icon;
  final void Function()? onTapIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool? autofocus;
  final String? Function(String?)? valid;
  final void Function(String)? onChanged;
  final bool? enabled;
  final Color? iconColor;
  final TextInputType? keyboardType;
  final bool? password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 8),
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        autofocus: autofocus!,
        validator: valid,
        onChanged: onChanged,
        enabled: enabled,
        obscureText: password!,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: InkWell(
            onTap: onTapIcon,
            child: Icon(icon, color: iconColor),
          ),
          suffixIcon:
              suffixIcon != null ? Icon(suffixIcon, color: iconColor) : null,
        ),
      ),
    );
  }
}
