import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

TableRow tableRowFour(
    {required String c1,
    required String c2,
    required String c3,
    required String c4,
    bool header = false}) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
        text: c1,
        size: Dimensions.fontSize12,
        textColor: header ? Colors.red : Colors.black87,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
        text: c2,
        size: Dimensions.fontSize12,
        textColor: header ? Colors.red : Colors.black87,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
        text: c3,
        size: Dimensions.fontSize12,
        textColor: header ? Colors.red : Colors.black87,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: header ? Dimensions.height10 : Dimensions.height5,
          horizontal: Dimensions.height10),
      child: CustomBigText(
        text: c4,
        size: Dimensions.fontSize12,
        textColor: header ? Colors.red : Colors.black87,
      ),
    ),
  ]);
}
