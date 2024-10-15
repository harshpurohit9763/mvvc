import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/core/services/bindings.dart';
import 'package:taskify/core/services/themes.dart';
import 'package:taskify/presentation/routes/routes_handler.dart';

void main() async {
  // Get.put(MyBindings());
  runApp(MyApp());
  await ScreenUtil.ensureScreenSize();
  //  OnInit() {
  //   super.onInit();
  //   getinstance();
  // }

  // getinstance() async {
  AppConstants.taskSharedPrefs = await SharedPreferences.getInstance();
  AppConstants.profileData = await SharedPreferences.getInstance();
  // }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themesService = Get.put(ThemesService());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // enableScaleText: () => false,
      // minTextAdapt: false,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Taskify',
            themeMode:
                themesService.isDark.value ? ThemeMode.dark : ThemeMode.light,
            theme:
                //  ThemeData(
                //   useMaterial3: true,
                // ),
                //  AppTheme.lightTheme(),

                themesService.isDark.value
                    ? ThemeData.dark(
                        useMaterial3: true,
                      )
                    : ThemeData.light(
                        useMaterial3: true,
                      ),
            // home: Onboardingscreen(),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            initialBinding: MyBindings(),
            builder: EasyLoading.init(),
          ),
        );
      },
      designSize: const Size(360, 690),
      // child:
    );
  }
}
