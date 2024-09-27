import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/presentation/controllers/onboarding_and_login/onboarding_and_login_controller.dart';
import 'package:taskify/presentation/routes/app_routes_names.dart';
import 'package:taskify/presentation/screens/onboarding/widgets/tile_widget.dart';
import 'package:taskify/presentation/widgets/ElevatedButton.dart';
import 'package:taskify/presentation/widgets/text_form_filed.dart';

class Onboardingscreen extends StatelessWidget {
  Onboardingscreen({super.key});

  OnboardingAndLoginController controller =
      Get.put(OnboardingAndLoginController());

  PageController pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> txtControllers = List.generate(
      controller.loginText.length,
      (index) => TextEditingController(),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingExtension.symmetric(horizontal: 24, vertical: 8),
          child: Obx(
            () => Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: controller.isNextCompleted.value
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome To\nTaskify",
                        style: GoogleFontsExtensation.headingBig,
                        // style: GoogleFontsExtensation.montesartTitle,
                        textAlign: controller.isNextCompleted.value
                            ? TextAlign.center
                            : TextAlign.left,
                      ),
                      controller.isNextCompleted.value
                          ? Container()
                          : CustomElevatedButton(
                              onPressed: () {
                                controller.animate();
                              },
                              text: "Skip",
                              backgroundColor:
                                  ColourConstants.secondarybuttonBackground,
                              borderColor: ColourConstants.divider,
                              raduis: 10,
                              padding: PaddingExtension.all(12),
                            )
                    ],
                  ),
                  Spacer(),
                  controller.isHidden.value
                      ? Container(
                          child: Column(
                            children: [
                              Divider(
                                color: ColourConstants.divider,
                              ),
                              Text(
                                controller.isSignup.value
                                    ? "Create Account"
                                    : "Login",
                                style: GoogleFontsExtensation.bodyTextMedium,
                              ),
                              Column(
                                  children: List.generate(
                                controller.isSignup.value == false
                                    ? 2
                                    : controller.loginText.length,
                                (index) {
                                  return Padding(
                                    padding: PaddingExtension.all(12),
                                    child: CustomTextFormField(
                                      text: controller.loginText[index],
                                      controller: txtControllers[index],
                                      validator: (p0) {
                                        // if (controller.isSignup.value ==
                                        //     false) {
                                        if (txtControllers[index].text.length ==
                                                0 ||
                                            p0!.isEmpty) {
                                          return "Enter ${controller.loginText[index]}";
                                          // }
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  );
                                },
                              )),
                            ],
                          ),
                        )
                      : Container(
                          height: controller.boxheight.value,
                          child: TileWidgetForOnboarding(
                              pageController: pageController,
                              controller: controller),
                        )
                  // : Container()
                  ,
                  Spacer(),
                  CustomElevatedButton(
                    onPressed: () {
                      if (controller.isNextCompleted.value == false) {
                        if (controller.slideIndex.value <
                            ImageConstants.tiles.length - 1) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);

                          controller.slideIndex.value++;
                        } else {
                          controller.animate();
                        }
                      } else {
                        if (_formKey.currentState!.validate()) {
                          if (controller.isSignup.value) {
                            controller.createUser();
                          } else {
                            controller.loginUser();
                          }
                        }
                      }
                      Get.offAndToNamed(RoutesConstants.navigatorScreen);
                    },
                    text:
                        controller.isNextCompleted.value ? "Let's GO" : "Next",
                    backgroundColor: ColourConstants.secondarybuttonBackground,
                    // style: Theme.of(context).textTheme.labelLarge,
                    raduis: 100,
                    // width: 0.3.sw,
                    padding: PaddingExtension.symmetric(
                      horizontal: 90.w,
                      vertical: 10.h,
                    ),
                  ),
                  Spacer(),
                  controller.isHidden.value
                      ? GestureDetector(
                          onTap: () {
                            controller.isSignup.value =
                                !controller.isSignup.value;
                          },
                          child: Container(
                            child: Text(
                              controller.isSignup.value ? "Login" : "Sign Up?",
                              style: GoogleFontsExtensation.otherTextMedium,
                            ),
                          ),
                        )
                      : Container(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
