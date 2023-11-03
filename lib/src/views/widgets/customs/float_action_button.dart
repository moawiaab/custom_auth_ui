import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({super.key, this.refresh, this.share, this.add});

  final void Function()? refresh;
  final void Function()? share;
  final void Function()? add;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add),
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          onTap: add,
          shape: const CircleBorder(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.refresh_rounded),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onTap: refresh,
          shape: const CircleBorder(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.share_rounded),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: share,
          shape: const CircleBorder(),
        ),
      ],
    );
  }
}
