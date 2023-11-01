library custom_auth_ui;

import 'src/views/widgets/customs/top_search_icon.dart';
import 'package:flutter/material.dart';

export 'src/views/screen/login.dart';
export 'src/custom_input_and_icon.dart';
export 'src/custom_core.dart';
export 'src/custom_view.dart';

class CustomAuthUI {
  CustomSearchAndIcon customSearch({
    IconData? icon = Icons.refresh_rounded,
    void Function()? onTapIcon,
    bool? closeable = false,
    void Function()? clearText,
    Color color = Colors.grey,
    void Function(String)? onChanged,
    Duration? debounceTime,
  }) {
    return CustomSearchAndIcon(
      closeable: closeable,
      clearText: clearText,
      color: color,
      icon: icon,
      onTapIcon: onTapIcon,
      debounceTime: debounceTime,
      onChanged: onChanged,
    );
  }
}
