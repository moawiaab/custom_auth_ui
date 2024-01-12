import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:custom_auth_ui/src/data/models/dropdown_model.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    this.icon = Icons.list,
    this.iconColor = Colors.grey,
  });
  final DropdownModel? value;
  final List<DropdownModel>? items;
  final void Function(dynamic)? onChanged;
  final IconData? icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.fontSize24 / 3, horizontal: Dimensions.height15),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height15, vertical: Dimensions.height5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height50 / 2),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, Dimensions.fontSize24 / 3),
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: Dimensions.height10),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              // Initial ValueS
              value: value!.id,
              // Down Arrow Icon
              icon: Icon(Icons.keyboard_arrow_down, color: iconColor),
              // Array list of items
              items: items!.map((DropdownModel items) {
                return DropdownMenuItem(
                  value: items.id,
                  child: Text(items.name),
                );
              }).toList(),

              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
