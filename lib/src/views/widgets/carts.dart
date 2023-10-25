import 'package:flutter/material.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    super.key,
    required this.child,
    this.c1 = Colors.red,
    this.c2 = Colors.yellow,
    this.c3 = Colors.green,
    this.c4 = Colors.white,
    this.rBorder = 10,
    this.dx = 0,
    this.dy = 5,
    this.height,
    this.width,
    this.margin,
    this.padding,
  });
  final Widget child;
  final Color? c1;
  final Color? c2;
  final Color? c3;
  final Color? c4;
  final double? rBorder;
  final double? dx;
  final double? dy;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      width: null,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(rBorder!),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(dx!, dy!),
              blurRadius: 2,
              spreadRadius: 3),
        ],
        gradient: LinearGradient(
          colors: [c1!, c2!, c3!, c4!],
        ),
      ),
      child: child,
    );
  }
}
