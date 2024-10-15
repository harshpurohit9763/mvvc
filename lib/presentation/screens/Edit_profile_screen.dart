import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/data/offlineData/profile_shared_prefs.dart';
import 'package:taskify/presentation/controllers/onboarding_and_login/onboarding_and_login_controller.dart';
import 'package:taskify/presentation/widgets/text_form_filed.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final onboardingController = Get.put(OnboardingAndLoginController());
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> txtControllers = List.generate(
      onboardingController.loginText.length,
      (index) => TextEditingController(),
    );
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 35.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Profile"),
              GestureDetector(
                onTap: () {
                  ProfileSharedPrefs.profilePictureset(
                      onboardingController.selectedProfile.value);
                  onboardingController.update();
                  Get.back();
                },
                child: Image(
                    image: const AssetImage(
                      ImageConstants.saveIcon,
                    ),
                    height: AppConstants.iconSizesmall),
              )
            ],
          ),
        ),
        body: Container(
          height: 1.0.sh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100.r,
                  backgroundImage: AssetImage(
                      ProfileSharedPrefs.profilePictureGet() != null
                          ? ImageConstants.profileImages[
                              onboardingController.selectedProfile.value]
                          : ImageConstants.paw),
                ),
                Wrap(
                  children: List.generate(
                    ImageConstants.profileImages.length,
                    (index) {
                      return Padding(
                        padding: PaddingExtension.symmetric(
                            horizontal: 8, vertical: 4),
                        child: GestureDetector(
                          onTap: () {
                            onboardingController.selectedProfile.value = index;
                            onboardingController.update();
                          },
                          // color:  ColourConstants.backgroundPrimaryfirst.withOpacity(0.3)
                          //     : null,
                          child: CircleAvatar(
                            backgroundColor:
                                onboardingController.selectedProfile.value ==
                                        index
                                    ? ColourConstants.accents
                                    : null,
                            backgroundImage: AssetImage(
                              ImageConstants.profileImages[index],
                            ),
                            radius: 25.r,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: List.generate(
                    txtControllers.length,
                    (index) {
                      return Padding(
                        padding: PaddingExtension.symmetric(
                            horizontal: 8, vertical: 8),
                        child: CustomTextFormField(
                            inputFormatters: index == 3
                                ? [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(2)
                                  ]
                                : index == 5
                                    ? [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10)
                                      ]
                                    : [],
                            text:
                                "Edit ${onboardingController.loginText[index]}",
                            controller: TextEditingController()),
                      );
                    },
                  ),
                ),
                // Spacer(),
                Padding(
                  padding:
                      PaddingExtension.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    "Made With ❤️",
                    style: GoogleFontsExtensation.bodyTextSmall,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
