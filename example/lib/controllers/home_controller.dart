import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/views/screen/client_screen.dart';
import 'package:example/views/screen/expanse_screen.dart';
import 'package:example/views/screen/order_screen.dart';
import 'package:example/views/screen/product_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {

  
  late PersistentTabController pageController;
  late bool hideNavBar;
  List<String> pageTitleList = ["bt1".tr,"bt2".tr,"bt3".tr,"bt4".tr];
  late String pageTitle = pageTitleList[0];

  List<Widget> buildScreens() => [
        const ProductScreen(),
        const ClientScreen(),
        const OrderScreen(),
        const ExpanseScreen(),
      ];

  List<PersistentBottomNavBarItem> navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_outlined),
            title: "bt1".tr,
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2_outlined),
          title: "bt2".tr,
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          title: "bt3".tr,
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.import_export_rounded),
          title: "bt4".tr,
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  void onInit() {
    pageController = PersistentTabController();
    hideNavBar = false;
    pageTitle = pageTitleList[0];
    super.onInit();
  }

  void setTitle(int value) {
    pageTitle = pageTitleList[value];
    update();
  }
}
