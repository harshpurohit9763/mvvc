import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/core/services/themes.dart';
import 'package:taskify/presentation/controllers/navigation_screen/navigation_Screen_controller.dart';
import 'package:taskify/presentation/screens/home/homescreen.dart';

class NavigatorScreen extends StatelessWidget {
  NavigatorScreen({super.key});
  final getcontroller = Get.find<NavigationScreenController>();
  final themesService = Get.find<ThemesService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 35.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Taskify"),
              GestureDetector(
                onTap: () {
                  themesService.isDark.value = !themesService.isDark.value;
                },
                child: themesService.isDark.value
                    ? Image(
                        image: const AssetImage(
                          ImageConstants.lightIcon,
                        ),
                        height: 30.h)
                    : Image(
                        image: const AssetImage(
                          ImageConstants.darkIcon,
                        ),
                        height: 30.h),
              )
            ],
          ),
        ),
        body: getcontroller.pages[getcontroller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            enableFeedback: false,
            // fixedColor: Colors.black,
            // type: BottomNavigationBarType.shifting,
            currentIndex: getcontroller.currentIndex.value,
            // mouseCursor: SystemMouseCursors.none,
            // useLegacyColorScheme: false,
            onTap: (value) {
              getcontroller.currentIndex.value = value;
            },
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            items: List.generate(
              getcontroller.pagesNames.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(
                      getcontroller.pagesicons[index],
                    ),
                    height: 35.h,
                  ),
                  label: getcontroller.pagesNames[index],
                );
              },
            )),
      ),
    );
  }
}
