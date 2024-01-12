import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderTextInput extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  TextEditingController? controller;
  TextInputType? type;
  OrderTextInput({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.type = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Dimensions.height15)),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
