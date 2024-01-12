import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

TableRow printTableRowDetails(
    {required String name,
    required String details,
    bool header = false,
    List<Widget>? col}) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height5, horizontal: Dimensions.height10),
      child: CustomBigText(
        text: name,
        size: Dimensions.fontSize16,
        textColor: Colors.black87,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
          text: details,
          size: Dimensions.fontSize16,
          textColor: Colors.black87),
    ),
  ]);
}
