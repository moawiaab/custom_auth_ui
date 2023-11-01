import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:get/get.dart';
import 'package:example/core/constant.dart';

class ProductRep extends GetxService {
  final CustomServices services;
  ProductRep({required this.services});

  Future<Response> getCategories() async {
    return await services.api.getData(AppConstantText.categoryUrl);
  }
}
