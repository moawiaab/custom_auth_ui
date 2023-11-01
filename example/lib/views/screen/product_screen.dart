import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/controllers/product_controller.dart';
import 'package:example/data/models/category_model.dart';
import 'package:example/views/widgets/items/category_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          CustomAuthUI().customSearch(
            
          ),
          GetBuilder<ProductController>(builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height5),
              width: double.infinity,
              height: Dimensions.height40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoriesList.length,
                  itemBuilder: (context, index) {
                    Category cate = controller.categoriesList[index];
                    return CategoryItem(text: cate.name, num: cate.id);
                  }),
            );
          }),

          
        ],
      ),
    );
  }
}
