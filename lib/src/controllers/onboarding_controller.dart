import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();

  int currentPage = 0;

  void onPageChanged(int val) {
    currentPage = val;
    update();
  }

  void next(int page) {
    if (currentPage < page) {
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    } else {
      Get.offNamed("/login");
    }

    update();
  }

  void back() {
    if (currentPage > 0) {
      currentPage--;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }

    update();
  }

  void skip() {
    Get.offNamed("/login");
  }
}
