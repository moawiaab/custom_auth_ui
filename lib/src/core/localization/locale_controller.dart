import 'dart:ui';

import 'package:custom_auth_ui/src/core/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  CustomServices services = Get.find();

  @override
  void onInit() {
    String? sharePreLang = services.sharedPreferences.getString("lang");

    if (sharePreLang == "ar") {
      language = const Locale("ar");
    } else if (sharePreLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

  changeLang(String lang) {
    Locale locale = Locale(lang);
    services.sharedPreferences.setString("lang", lang);
    Get.updateLocale(locale);
  }
}
