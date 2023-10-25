import 'package:get/get.dart';

validInput(
  String val, {
  bool isEmail = false,
  bool isRequire = false,
  bool isPhone = false,
  bool isNumber = false,
  bool isDateTime = false,
  int min = 0,
  int max = 0,
}) {
  if (val.isEmpty) {
    return "input is require";
  }

  if (isEmail && !GetUtils.isEmail(val)) {
    return "email felid";
  }
  if (isPhone && !GetUtils.isPhoneNumber(val)) {
    return "phone felid";
  }
  if (isNumber && !GetUtils.isNumericOnly(val)) {
    return "entry number";
  }
  if (isDateTime && !GetUtils.isDateTime(val)) {
    return "entry date time only";
  }
}
