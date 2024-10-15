import 'package:taskify/core/constants/app_constants.dart';

class ProfileSharedPrefs {
  static profilePictureGet() {
    final prefs = AppConstants.profileData;

    return prefs?.getInt("profileimage");
  }

  static profilePictureset(int index) {
    final prefs = AppConstants.profileData;

    return prefs?.setInt("profileimage", index);
  }
}
