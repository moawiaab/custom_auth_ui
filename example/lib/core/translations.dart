import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:get/get.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "lang": "تغيير اللغة",
          "ar": "عربي",
          "en": "انجليزي",
          ...TranslationData().keysAr,
          "bt1": "الرئيسية",
          "bt2": "العملاء",
          "bt3": "الفواتير",
          "bt4": "المصروفات",
        },
        "en": {
          "lang": "change the language",
          "ar": "Arabic",
          "en": "English",
          ...TranslationData().keysEn,
          "bt1": "Home",
          "bt2": "Clients",
          "bt3": "Orders",
          "bt4": "Expanses",
        }
      };
}
