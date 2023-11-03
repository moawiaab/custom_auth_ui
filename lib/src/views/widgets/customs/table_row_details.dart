import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

TableRow tableRowDetails(
    {required String name, required String details, bool header = false}) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
        text: name,
        size: Dimensions.fontSize16,
        textColor: header ? Colors.red : null,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
          text: details,
          size: Dimensions.fontSize16,
          textColor: header ? Colors.red : null),
    )
  ]);
}
