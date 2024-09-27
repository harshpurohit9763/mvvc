import 'package:get/get.dart';
import 'package:taskify/presentation/routes/app_routes_names.dart';
import 'package:taskify/presentation/screens/home/navigator_screen.dart';
import 'package:taskify/presentation/screens/onboarding/onboardingScreen.dart';
import 'package:taskify/presentation/screens/note_screen/Add_Note_screen.dart';

class AppPages {
  static var initial = RoutesConstants.onboardingScreen;

  static final routes = [
    GetPage(
      name: RoutesConstants.onboardingScreen,
      page: () => Onboardingscreen(),
    ),
    GetPage(
      name: RoutesConstants.navigatorScreen,
      page: () => NavigatorScreen(),
    ),
    GetPage(
      name: RoutesConstants.addNote,
      page: () => AddNoteScreen(),
    )
  ];
}
