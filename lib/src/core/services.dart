import 'package:custom_auth_ui/src/data/api_%20client.dart';
import 'package:custom_auth_ui/src/data/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late ApiClient api;

  Future<CustomServices> init(String baseUrl) async {
    sharedPreferences = await SharedPreferences.getInstance();
    api = ApiClient(appBaseUrl: baseUrl);
    // api.appBaseUrl = baseUrl;

    return this;
  }
}

initialServices({String baseUrl = "http://10.0.2.2:8000"}) async {
  await Get.putAsync(() => CustomServices().init(baseUrl));
  Get.lazyPut(() => AuthRepository(services: Get.find()));
}
