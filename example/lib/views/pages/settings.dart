import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController local = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "1".tr, textColor: Theme.of(context).primaryColor, fontWeight: true),
        backgroundColor: Colors.grey.withOpacity(0.1),
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        surfaceTintColor: Theme.of(context).primaryColor,
        shadowColor: Theme.of(context).primaryColor,
      ),
        body: PageView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "lang".tr),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilledButton.tonalIcon(
                    onPressed: () {
                      local.changeLang("ar");
                    },
                    icon: Icon(
                      Get.locale!.languageCode == "ar"
                          ? Icons.done
                          : Icons.language_outlined,
                      color: Colors.amber,
                    ),
                    label: BigText(
                        text: "ar".tr,
                        fontWeight: true,
                        size: Dimensions.fontSize16),
                  ),
                  SizedBox(width: Dimensions.width20),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      local.changeLang("en");
                    },
                    icon: Icon(
                      Get.locale!.languageCode == "en"
                          ? Icons.done
                          : Icons.language_outlined,
                      color: Colors.amber,
                    ),
                    label: BigText(
                        text: "en".tr,
                        fontWeight: true,
                        size: Dimensions.fontSize16),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        )
      ],
    ));
  }
}
