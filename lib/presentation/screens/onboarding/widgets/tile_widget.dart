import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/presentation/controllers/onboarding_and_login/onboarding_and_login_controller.dart';

class TileWidgetForOnboarding extends StatelessWidget {
  TileWidgetForOnboarding({
    super.key,
    required this.pageController,
    required this.controller,
    // required this.height,
    // required this.padding,
    // required this.radius,
  });

  final PageController pageController;
  final OnboardingAndLoginController controller;
//   final height;
// EdgeInsets padding;
// double radius;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35.r),
            child: Container(
              height: controller.boxheight.value - 0.045.sh,
              // width: controller.boxWidth.value - 0.045.sw,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              // color: Colors.amber,
              child: PageView.builder(
                controller: pageController,
                itemCount: ImageConstants.tiles.length,
                onPageChanged: (value) {
                  controller.slideIndex.value = value;
                },
                allowImplicitScrolling: false,
                itemBuilder: (context, index) {
                  return Image.asset(
                    ImageConstants.tiles[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          controller.isNextCompleted.value
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    ImageConstants.tiles.length,
                    (index) {
                      return Padding(
                          padding: PaddingExtension.all(10),
                          child: CircleAvatar(
                            backgroundColor:
                                controller.slideIndex.value <= index
                                    ? ColourConstants.secondarybuttonBackground
                                    : ColourConstants.primamrybuttonBackground,
                            radius: 5.r,
                          ));
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
