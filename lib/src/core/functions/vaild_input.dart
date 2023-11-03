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
    return "2".tr;
  }

  if (isEmail && !GetUtils.isEmail(val)) {
    return "3".tr;
  }
  if (isPhone && !GetUtils.isPhoneNumber(val)) {
    return "4".tr;
  }
  if (isNumber && !GetUtils.isNumericOnly(val)) {
    return "5".tr;
  }
  if (isDateTime && !GetUtils.isDateTime(val)) {
    return "8".tr;
  }

  if (min != 0 && val.length < min) {
    return "6".tr;
  }

  if (max != 0 && val.length > max) {
    return "7".tr;
  }
}
