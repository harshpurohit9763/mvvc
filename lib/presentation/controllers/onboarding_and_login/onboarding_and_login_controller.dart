import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingAndLoginController extends GetxService {
  RxInt slideIndex = 0.obs;
  RxBool isNextCompleted = false.obs;
  RxBool isHidden = false.obs;
  RxDouble boxheight = (0.7.sh).obs;
  RxDouble boxWidth = (1.sh).obs;
  // RxDouble leftpadding = (0.05.sw).obs;
  // RxDouble topPadding = (0.05.sw).obs;

  List loginText = [
    "Email",
    "Password",
    "Name",
    "Age",
    "Gender",
    "Phone",
  ];

  animate() {
    isNextCompleted.value = true;
    Timer.periodic(
      Duration(milliseconds: 20),
      (timer) {
        if (boxheight.value > 0.055.sh && boxWidth.value > 0.1.sw) {
          boxheight - 0.01.sh;
        } else {}
        // controller.boxWidth.value = 1.0.sw;
      },
    );
    Future.delayed(
      Duration(seconds: 2),
      () {
        isHidden.value = true;
      },
    );
  }

  RxBool isSignup = false.obs;

  createUser() {}
  loginUser() {}
}
