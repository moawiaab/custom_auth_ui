import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:example/data/models/category_model.dart';
import 'package:get/get.dart';
import 'package:example/data/repository/product_rep.dart';

abstract class AbstractProductController extends GetxController {
  final CustomServices services;
  final ProductRep productRep;
  AbstractProductController({required this.services, required this.productRep});

  void getCategories();
}

class ProductController extends AbstractProductController {
  ProductController({required super.services, required super.productRep});
  List<dynamic> _categoriesList = [];
  List<dynamic> get categoriesList => _categoriesList;

  @override
  void getCategories() async {
    Response response = await productRep.getCategories();
    if (response.statusCode == 200) {
      _categoriesList = [];
      _categoriesList.addAll(CategoryModel.fromJson(response.body).category);
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
