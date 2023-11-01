library custom_auth_ui;

import 'package:custom_auth_ui/src/views/widgets/customs/top_search_icon.dart';
import 'package:flutter/material.dart';

export 'src/views/screen/login.dart';
export 'src/custom_input_and_icon.dart';
export 'src/custom_core.dart';
export 'src/custom_view.dart';

class CustomAuthUI {
  CustomSearchAndIcon customSearch({
    IconData? icon = Icons.refresh_rounded,
    TextEditingController? controller,
    void Function()? onTapIcon,
    bool? closeable = false,
    void Function()? clearText,
    Color? color = Colors.grey,
  }) {
    return CustomSearchAndIcon(
      closeable: closeable,
      clearText: clearText,
      color: color!,
      controller: controller,
      icon: icon,
      onTapIcon: onTapIcon,
    );
  }
}
