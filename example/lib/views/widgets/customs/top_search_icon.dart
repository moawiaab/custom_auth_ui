import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class CustomSearchAndIcon extends StatelessWidget {
  const CustomSearchAndIcon({
    super.key,
    this.icon = Icons.refresh_rounded,
    this.controller,
    this.onTapIcon,
    this.closeable = false,
    this.clearText,
  });
  final IconData? icon;
  final TextEditingController? controller;
  final void Function()? onTapIcon;
  final bool? closeable;
  final void Function()? clearText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height10, vertical: Dimensions.height10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
              width: double.infinity,
              height: Dimensions.height50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search,
                        color: Theme.of(context).primaryColor),
                    suffixIcon: closeable!
                        ? InkWell(
                            onTap: clearText, child: const Icon(Icons.close))
                        : null),
              ),
            ),
          ),
          SizedBox(width: Dimensions.height10),
          InkWell(
            onTap: onTapIcon,
            child: Container(
              height: Dimensions.height50,
              width: Dimensions.height50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
