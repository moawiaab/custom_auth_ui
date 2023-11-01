import 'package:get/get.dart';
import 'package:example/controllers/product_controller.dart';
import 'package:example/data/repository/product_rep.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // repositories
    Get.put(ProductRep(services: Get.find()));

//controllers
    Get.lazyPut(
        () => ProductController(services: Get.find(), productRep: Get.find()));
  }
}
