import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.text, required this.num});
  final String text;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 5),
                blurRadius: 2,
                spreadRadius: 1)
          ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: BigText(
              text: num.toString(),
              textColor: Colors.red,
              size: Dimensions.fontSize14,
              fontWeight: true,
            ),
          ),
          BigText(
            text: text,
            size: Dimensions.fontSize14,
            fontWeight: true,
            textColor: Colors.red,
          ),
          SizedBox(width: Dimensions.width5)
        ],
      ),
    );
  }
}
