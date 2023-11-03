import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomSlidable(
              adding: true,
              shearing: true,
              toggle: true,
              toggling: true,
              child: const ListTile(
                title: Text("data test"),
              ),
              onPressed: (c) {
                print(c);
              },
            ),
            CustomSlidable(
              child: const ListTile(
                title: Text("data test"),
              ),
              onPressed: (c) {},
            ),
            CustomSlidable(
              child: const ListTile(
                title: Text("data test"),
              ),
              onPressed: (c) {},
            ),
            CustomSlidable(
              child: const ListTile(
                title: Text("data test"),
              ),
              onPressed: (c) {},
            ),
            CustomSlidable(
              toggle: false,
              child: const ListTile(
                title: Text("data test"),
              ),
              onPressed: (c) {
                print(c);
              },
            ),
          ],
        ),
      ),
    );
  }
}
