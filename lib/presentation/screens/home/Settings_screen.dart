import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/data/offlineData/profile_shared_prefs.dart';
import 'package:taskify/presentation/controllers/onboarding_and_login/onboarding_and_login_controller.dart';
import 'package:taskify/presentation/controllers/settings/settings_controller.dart';
import 'package:taskify/presentation/routes/app_routes_names.dart';
import 'package:taskify/presentation/widgets/dilouge.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final settingsController = Get.find<SettingsController>();
  final onboardingController = Get.put(OnboardingAndLoginController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.82.sh,
      width: 1.0.sw,
      // color: Colors.amberAccent,
      child: SingleChildScrollView(
          child: Column(
        children: [
          GetBuilder(
              init: OnboardingAndLoginController(),
              builder: (onboardingController) {
                return CircleAvatar(
                  radius: 100.r,
                  backgroundImage: AssetImage(
                      ProfileSharedPrefs.profilePictureGet() != null
                          ? ImageConstants.profileImages[
                              ProfileSharedPrefs.profilePictureGet()!]
                          : ImageConstants.paw),
                );
              }),
          Column(
            children: List.generate(
              settingsController.options.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.toNamed(RoutesConstants.editProfile);
                    } else if (index == 1) {
                      Get.toNamed(RoutesConstants.addTag);
                    } else if (index == 3) {
                      CustomDilougetoShow(
                          content: Center(
                        child: Column(
                          children: [
                            Text(
                              "Are you Sure ?",
                              style: GoogleFontsExtensation.headingBig,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "You Want to delete all Data",
                              style: GoogleFontsExtensation.headingSmall,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "This action will delete all the notes and tag's",
                              style: GoogleFontsExtensation.alertSmall,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                2,
                                (indexInternal) {
                                  return GestureDetector(
                                    onTap: () {
                                      indexInternal == 0
                                          ? {
                                              AppConstants.taskSharedPrefs
                                                  ?.clear(),
                                              Get.back()
                                            }
                                          : Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColourConstants
                                            .primamrybuttonBackground,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      padding: PaddingExtension.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        indexInternal == 0 ? "Yes" : "No",
                                        style:
                                            GoogleFontsExtensation.headingBig,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ));
                    } else if (index == 4) {
                      Get.offAllNamed(RoutesConstants.onboardingScreen);
                    }
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: PaddingExtension.symmetric(
                          vertical: 24, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            settingsController.options[index],
                            style: GoogleFontsExtensation.bodyTextMedium,
                          ),
                          Image.asset(
                            settingsController.optionsimages[index],
                            height: AppConstants.iconSizesmall,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
