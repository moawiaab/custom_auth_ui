import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class CustomViewer extends StatelessWidget {
  const CustomViewer({
    super.key,
    required this.statusRequired,
    required this.child,
    this.bottom = 0,
  });
  final StatusRequired statusRequired;
  final Widget child;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            // margin: EdgeInsets.all(Dimensions.height20),
            // padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height20),
              color: Colors.white,
            ),
            child: child,
          ),
        ),
        statusRequired == StatusRequired.loading
            ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: bottom,
                child: Container(
                  margin: EdgeInsets.all(Dimensions.height5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height20),
                      color: Colors.black.withOpacity(0.3)),
                  child: const Center(
                      child: Image(
                    image: AssetImage("assets/images/loading.gif"),
                  )),
                ),
              )
            : Container()
      ],
    );
  }
}
