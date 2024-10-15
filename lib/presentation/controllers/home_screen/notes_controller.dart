import 'dart:developer';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/data/model/tasks/task_model.dart';
import 'package:taskify/data/offlineData/task_shared_prefs.dart';
import 'package:taskify/presentation/routes/app_routes_names.dart';

// class NotesController extends GetxController {
//   onInit() {
//     super.onInit();
//     getallNotes();
//     getalltags();
//   }

//   RxList addOptions = [
//     "Add Note",
//     "Send Memo",
//   ].obs;
//   RxList addOptionsIcons = [
//     ImageConstants.addIcon,
//     ImageConstants.sendIcon,
//   ].obs;

//   TextEditingController title = TextEditingController();
//   TextEditingController tag = TextEditingController();

//   TextEditingController discription = TextEditingController();
//   TextEditingController content = TextEditingController();

//   RxBool ismoreSelected = true.obs;
//   FilePickerResult? images;
//   RxList imagesPath = [].obs;
//   FilePickerResult? videos;
//   filePicker() async {
//     // await FilePicker.platform.getDirectoryPath();
//     images = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: [
//         'jpg',
//         'png',
//       ],
//     );
//     if (images != null) {
//       for (var i = 0; i < images!.files.length; i++) {
//         imagesPath.add(images!.files[i].path);
//       }
//       update();
//       log(images!.files.length.toString());
//     }
//     ismoreSelected(false);
//   }

//   // RxList notes = [].obs;
//   RxList<SingleTaskData> tasksOffline = <SingleTaskData>[].obs;
//   List<String> tagsLIst = [];
//   getallNotes() {
//     tasksOffline.addAll(TaskSharedPrefs.getTasks());
//   }

//   getalltags() {
//     tagsLIst.assignAll(TaskSharedPrefs.getTag());
//   }

//   saveTag() {
//     if (tagsLIst.contains(tag.text)) {
//       return null;
//     } else {
//       tagsLIst.add(tag.text);
//       TaskSharedPrefs.saveTag(tagsLIst);
//     }
//   }

//   addNotetoStorage() {
//     tasksOffline.add(SingleTaskData(
//       title: title.text,
//       content: content.text,
//       createdAt:
//           "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
//       tags: tag.text,
//       contentImages: imagesPath,
//     ));
//     update();
//     // log(tasksOffline[0].content.toString());
//     TaskSharedPrefs.saveTasks(tasksOffline);

//     title.clear();
//     tag.clear();
//     // date.clear();
//     discription.clear();
//     content.clear();
//     imagesPath.clear();

//     Get.back();
//     update();
//   }

//   RxInt selectedNote = 0.obs;
//   deletenote() {
//     // tasksOffline.removeAt(selectedNote.value);
//     TaskSharedPrefs.saveTasks(tasksOffline);
//     update();
//   }
// }

class NotesController extends GetxController {
  // Initialize with proper data types and ensure everything is error-proof
  RxList<String> addOptions = [
    "Add Note",
    "Send Memo",
  ].obs;

  RxList<String> addOptionsIcons = [
    ImageConstants.addIcon,
    ImageConstants.sendIcon,
  ].obs;

  // Declare the TextEditingControllers for title, tag, description, and content
  final TextEditingController title = TextEditingController();
  final TextEditingController tag = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController content = TextEditingController();

  // Observables for managing state
  RxBool isMoreSelected = true.obs;

  // Initialize lists to store images and tags
  FilePickerResult? images;
  RxList<String> imagesPath = <String>[].obs;
  FilePickerResult? videos;

  RxList<SingleTaskData> tasksOffline = <SingleTaskData>[].obs;
  List<String> tagsList = [];

  // Called when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    getAllNotes();
    getAllTags();
  }

  // Fetch all notes from storage
  void getAllNotes() {
    tasksOffline.clear();
    tasksOffline.addAll(TaskSharedPrefs.getTasks() ?? []);
    update();
  }

  // Fetch all tags from storage
  void getAllTags() {
    tagsList.assignAll(TaskSharedPrefs.getTag() ?? []);
  }

  // Save a new tag if it doesn't already exist
  void saveTag() {
    if (tagsList.length >= 15) {
      EasyLoading.showInfo("Can't Add more than 15");
    } else if (tag.text.isNotEmpty && !tagsList.contains(tag.text)) {
      tagsList.add(tag.text);
      TaskSharedPrefs.saveTag(tagsList);
    }
    Get.back();
    update();
    tag.clear();
  }

  void deleteTag(int index) {
    tagsList.removeAt(index);
    TaskSharedPrefs.saveTag(tagsList);
    update();
  }

  // Add a new note to storage

  void addNoteToStorage() {
    if (title.text.isNotEmpty && content.text.isNotEmpty) {
      tasksOffline.add(SingleTaskData(
        title: title.text,
        content: content.text,
        createdAt:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        tags: tag.text,
        contentImages: imagesPath,
      ));

      TaskSharedPrefs.saveTasks(tasksOffline);

      // Clear the fields after saving
      title.clear();
      tag.clear();
      description.clear();
      content.clear();
      imagesPath.clear();

      Get.back();
      update(); // Update the UI
    } else {
      // Add proper error handling for empty fields
      Get.snackbar("Error", "Title and Content cannot be empty");
    }
  }

  // RxInt selectednote = 0.obs;
  void updateNoteToStorage() {
    if (title.text.isNotEmpty && content.text.isNotEmpty) {
      tasksOffline[selectedNote.value] = SingleTaskData(
        title: title.text,
        content: content.text,
        createdAt:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        tags: tag.text,
        contentImages: imagesPath,
      );

      TaskSharedPrefs.saveTasks(tasksOffline);

      // Clear the fields after saving
      title.clear();
      tag.clear();
      description.clear();
      content.clear();
      imagesPath.clear();

      Get.back();
      update(); // Update the UI
    } else {
      // Add proper error handling for empty fields
      Get.snackbar("Error", "Title and Content cannot be empty");
    }
  }

  // Select images using the FilePicker
  Future<void> filePicker() async {
    try {
      images = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (images != null) {
        for (var file in images!.files) {
          if (file.path != null) {
            imagesPath.add(file.path!); // Safely access file paths
          }
        }
        update(); // Update UI
      }
    } catch (e) {
      // Log or handle any errors that occur during file picking
      print("Error picking files: $e");
    } finally {
      isMoreSelected(false);
    }
  }

  // Delete the selected note
  void deleteNote() {
    if (selectedNote.value >= 0 && selectedNote.value < tasksOffline.length) {
      tasksOffline.removeAt(selectedNote.value);
      TaskSharedPrefs.saveTasks(tasksOffline);
      isviewMode.value ? Get.back() : null;
      update();
    } else {
      // Handle invalid deletion attempt
      Get.snackbar("Error", "Unable to delete the selected note");
    }
  }

  // Observable for the currently selected note
  RxInt selectedNote = 0.obs;

  // @override
  // void onClose() {
  //   // Dispose the TextEditingControllers to avoid memory leaks
  //   title.dispose();
  //   tag.dispose();
  //   description.dispose();
  //   content.dispose();
  //   super.onClose();
  // }

  RxBool isEditMode = false.obs;
  RxBool isviewMode = false.obs;
  RxBool isloading = false.obs;
  void openNote() async {
    isloading(true);
    isviewMode.value = true;
    content.text = tasksOffline[selectedNote.value].content.toString();
    title.text = tasksOffline[selectedNote.value].title.toString();
    imagesPath = RxList.from(tasksOffline[selectedNote.value].contentImages!);
    // update();
    imagesPath.refresh();
    Get.toNamed(RoutesConstants.addNote);
    update();
    isloading(false);
  }

  void closenote() {
    content.clear();
    title.clear();
    imagesPath.clear();
    update();
    Get.back();
    isviewMode.value = false;
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // You can change the alpha value for transparency, 255 is fully opaque
      random.nextInt(256), // Random red value (0-255)
      random.nextInt(256), // Random green value (0-255)
      random.nextInt(256), // Random blue value (0-255)
    );
  }
}
