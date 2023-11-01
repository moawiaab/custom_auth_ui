import 'dart:async';

import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomSearchAndIcon extends StatefulWidget {
  const CustomSearchAndIcon({
    super.key,
    this.icon = Icons.refresh_rounded,
    this.onTapIcon,
    this.closeable = false,
    this.clearText,
    required this.color,
    this.onChanged,
    this.debounceTime,
  });
  final IconData? icon;
  final void Function()? onTapIcon;
  final bool? closeable;
  final void Function()? clearText;
  final Color color;
  final ValueChanged<String>? onChanged;
  final Duration? debounceTime;

  @override
  State<CustomSearchAndIcon> createState() => _CustomSearchAndIconState();
}

class _CustomSearchAndIconState extends State<CustomSearchAndIcon> {
  final StreamController<String> _textChangeStreamController =
      StreamController();
  late StreamSubscription _textChangesSubscription;

  @override
  void initState() {
    _textChangesSubscription = _textChangeStreamController.stream
        .debounceTime(
          widget.debounceTime ??
              const Duration(
                seconds: 1,
              ),
        )
        .distinct()
        .listen((text) {
      final onChanged = widget.onChanged;
      if (onChanged != null) {
        onChanged(text);
      }
    });

    super.initState();
  }

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
                color: widget.color.withOpacity(0.1),
              ),
              child: TextFormField(
                onChanged: _textChangeStreamController.add,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: widget.color),
                    suffixIcon: widget.closeable!
                        ? InkWell(
                            onTap: widget.clearText,
                            child: const Icon(Icons.close))
                        : null),
              ),
            ),
          ),
          SizedBox(width: Dimensions.height10),
          InkWell(
            onTap: widget.onTapIcon,
            child: Container(
              height: Dimensions.height50,
              width: Dimensions.height50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10),
                color: widget.color.withOpacity(0.1),
              ),
              child: Icon(widget.icon, color: widget.color),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textChangeStreamController.close();
    _textChangesSubscription.cancel();
    super.dispose();
  }
}
