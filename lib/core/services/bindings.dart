import 'package:get/get.dart';
import 'package:taskify/core/services/themes.dart';
import 'package:taskify/presentation/controllers/home_screen/notes_controller.dart';
import 'package:taskify/presentation/controllers/navigation_screen/navigation_Screen_controller.dart';


//dependency injection 
class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationScreenController());
    Get.lazyPut(() => ThemesService());
    // Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => NotesController());
    // Register other services here
  }
}
