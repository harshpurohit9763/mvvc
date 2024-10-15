import 'package:get/get.dart';
import 'package:taskify/core/constants/image_constant.dart';

class SettingsController extends GetxController {
  List options = [
    "Edit Profile",
    "Add & View Tag's",
    "Delete Account",
    "Delete all Data",
    "Sign Out"
  ];

  List optionsimages = [
    ImageConstants.editIcon,
    ImageConstants.addIcon,
    ImageConstants.trashIcon,
    ImageConstants.cancleIcon,
    ImageConstants.keyIcon,
  ];
}
