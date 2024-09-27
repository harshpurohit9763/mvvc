import 'package:get/get.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/presentation/screens/home/Settings_screen.dart';
import 'package:taskify/presentation/screens/home/homescreen.dart';

class NavigationScreenController extends GetxService {
  RxInt currentIndex = 0.obs;
  RxList pagesNames = [
    "Home",
    // "AI",
    // "TO-DO",
    // "Notes",
    "Settings",
  ].obs;
  RxList pagesicons = [
    ImageConstants.homeIcon,
    // ImageConstants.aiIcon,
    // ImageConstants.todoIcon,
    // ImageConstants.memoIcon,
    ImageConstants.settingIcon,
  ].obs;
  RxList pages = [
    Homescreen(),
    // AiScreen(),
    // TodoScreen(),
    // MemosScreen(),
    SettingsScreen(),
  ].obs;
  OnTap(int index) {
    currentIndex.value = index;
  }
}
