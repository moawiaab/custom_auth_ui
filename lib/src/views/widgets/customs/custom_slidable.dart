import 'package:custom_auth_ui/src/core/status_require.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class CustomSlidable extends StatelessWidget {
  CustomSlidable({
    super.key,
    required this.onPressed,
    required this.child,
    this.toggle = true,
    this.editable = true,
    this.viewable = true,
    this.toggling = false,
    this.deletable = true,
    this.shearing = false,
    this.adding = false,
    this.defaultLeft = false,
    this.icon = Icons.shopping_cart_checkout,
  });

  final void Function(SlidableButtonType type) onPressed;
  final Widget child;
  final bool? toggle;
  final bool? editable;
  final bool? viewable;
  final bool? toggling;
  final bool? deletable;
  final bool? shearing;
  final bool? adding;
  IconData icon;
  final bool? defaultLeft;

  @override
  Widget build(BuildContext context) {
    List<Widget>? leftChildren = [
      editable!
          ? SlidableAction(
              onPressed: (context) => onPressed(SlidableButtonType.edit),
              backgroundColor: const Color(0xFF7BC043).withOpacity(0.1),
              foregroundColor: const Color(0xFF7BC043),
              icon: Icons.edit_note_rounded,
              // label: 'edit'.tr,
            )
          : Container(),
      adding!
          ? SlidableAction(
              onPressed: (context) => onPressed(SlidableButtonType.add),
              backgroundColor: const Color(0xFFAC1DA5).withOpacity(0.1),
              foregroundColor: const Color(0xFFAC1DA5),
              icon: Icons.add_circle_outlined,
              // label: 'show'.tr,
            )
          : Container(),
      viewable!
          ? SlidableAction(
              onPressed: (context) => onPressed(SlidableButtonType.show),
              backgroundColor: const Color(0xFF0392CF).withOpacity(0.1),
              foregroundColor: const Color(0xFF0392CF),
              icon: Icons.remove_red_eye_rounded,
              // label: 'show'.tr,
            )
          : Container(),
    ];
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: leftChildren,
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          shearing!
              ? SlidableAction(
                  onPressed: (context) {
                    onPressed(SlidableButtonType.shear);
                  },
                  backgroundColor: const Color(0xFF21B7CA).withOpacity(0.1),
                  foregroundColor: const Color(0xFF21B7CA),
                  icon: Icons.share,
                  // label: 'Share',
                )
              : Container(),
          toggling!
              ? SlidableAction(
                  onPressed: (context) => onPressed(SlidableButtonType.toggle),
                  backgroundColor: toggle!
                      ? const Color(0xFF4FA806).withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  foregroundColor:
                      toggle! ? const Color(0xFF4FA806) : Colors.grey,
                  icon: toggle!
                      ? Icons.toggle_on_outlined
                      : Icons.toggle_off_outlined,
                  // label: 'Archive',
                )
              : Container(),
          defaultLeft!
              ? SlidableAction(
                  onPressed: (context) => onPressed(SlidableButtonType.save),
                  backgroundColor: const Color(0xFF4FA806).withOpacity(0.1),
                  foregroundColor: const Color(0xFF4FA806),
                  icon: icon,
                  // label: 'Archive',
                )
              : Container(),
          deletable!
              ? SlidableAction(
                  onPressed: (context) {
                    onPressed(SlidableButtonType.delete);
                  },
                  backgroundColor: const Color(0xFFFE4A49).withOpacity(0.1),
                  foregroundColor: const Color(0xFFFE4A49),
                  icon: Icons.delete,
                  // label: 'Delete',
                )
              : Container(),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: child,
    );
  }
}
