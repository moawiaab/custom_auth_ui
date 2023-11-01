import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:example/core/binding.dart';
import 'package:example/core/routes.dart';
import 'package:example/core/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices(baseUrl: "http://10.0.2.2:8000/phone");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: CustomTranslations(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: RouteHelper.onboardingPage,
      // home: const LoginPage(),
      locale: controller.language,
      getPages: RouteHelper().routes,
      initialBinding: InitialBindings(),
    );
  }
}
