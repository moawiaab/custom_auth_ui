import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/controllers/home_controller.dart';
import 'package:example/core/routes.dart';
import 'package:example/views/widgets/items/item_text_icon.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(
          builder: (context) {
            return  Text(context.pageTitle);
          }
        ),
        backgroundColor: Colors.grey.withOpacity(0.1),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: Dimensions.screenHeight / 4,
                color: Theme.of(context).primaryColor.withOpacity(0.15),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height40),
                    Expanded(
                        child: CustomIcon(
                      text: "name",
                      iconSize: Dimensions.height20 * 4,
                      icon: Icons.person_rounded,
                    )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.height15),
                        width: double.infinity,
                        child: BigText(
                            text: "${"18".tr} : ", align: TextAlign.start))
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemTextWithIcon(
                        text: "Settings",
                        onTap: () {
                          Get.back();
                          Get.toNamed(RouteHelper.settingsPage);
                        }),
                    ItemTextWithIcon(text: "logout", onTap: () {}),
                    ItemTextWithIcon(text: "logout", onTap: () {}),
                  ],
                ),
              )),
              const ItemTextWithIcon(
                  text: "logout", color: Colors.red, icon: Icons.logout)
            ],
          ),
        ),
      ),
      body: PersistentTabView(
        onItemSelected: (value) {
          controller.setTitle(value);
        },
        context,
        controller: controller.pageController,
        screens: controller.buildScreens(),
        items: controller.navBarsItems(),
        resizeToAvoidBottomInset: true,
        bottomScreenMargin: 0,

        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
        hideNavigationBar: controller.hideNavBar,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property
      ),
    );
  }
}
