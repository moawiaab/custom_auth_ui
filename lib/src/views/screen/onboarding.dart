import 'package:custom_auth_ui/src/controllers/onboarding_controller.dart';
import 'package:custom_auth_ui/src/custom_core.dart';
import 'package:custom_auth_ui/src/custom_input_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key, this.onboardingPage});
  final List<OnboardingModel>? onboardingPage;

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> listData = onboardingPage ?? onboardingList;
    Get.put(OnboardingController());
    return Scaffold(
      body: GetBuilder<OnboardingController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (val) {
                  controller.onPageChanged(val);
                },
                controller: controller.pageController,
                itemCount: listData.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight / 2,
                        child: Image.asset(listData[index].image,
                            fit: BoxFit.fill),
                      ),
                      BigText(
                        text: listData[index].title,
                        textColor: Colors.grey,
                        size: Dimensions.fontSize24,
                      ),
                      BigText(
                        text: "${listData[index].description} ",
                        maxLine: false,
                        align: TextAlign.center,
                        size: Dimensions.fontSize16,
                        height: 2,
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              width: listData.length * Dimensions.height20,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    listData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.height5),
                      height: Dimensions.height5,
                      width: controller.currentPage == index
                          ? Dimensions.height20
                          : Dimensions.height5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.height25),
              // height: Dimensions.screenHeight / 8,
              alignment: Alignment.topCenter,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height30),
                    topLeft: Radius.circular(Dimensions.height30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: Offset(0, -Dimensions.height5),
                      color: Colors.grey.withOpacity(0.1),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.skip();
                    },
                    icon: const Icon(Icons.skip_next_rounded),
                    label: Text("back".tr),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      controller.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: controller.currentPage == 0 ? Colors.grey : null,
                  ),
                  SizedBox(width: Dimensions.width5),
                  IconButton.filledTonal(
                    onPressed: () {
                      controller.next(listData.length - 1);
                    },
                    icon: Icon(controller.currentPage + 1 == listData.length
                        ? Icons.done
                        : Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
