import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/data/model/tasks/task_model.dart';

class TaskSharedPrefs {
  // static saveTask(List tasks) {
  //   List<String> taskListJson =
  //       tasks.map((task) => jsonEncode(task.toJson())).toList();
  //   AppConstants.taskSharedPrefs?.setStringList("task_list", taskListJson);
  // }

  // static RxList<TaskModel> getTask() {
  //   var data = AppConstants.taskSharedPrefs?.getStringList("task_list");

  //   if (data != null) {
  //     return data;
  //   } else {
  //     return null;
  //   }
  // }

  static Future<void> saveTasks(RxList<SingleTaskData> tasksOffline) async {
    final prefs = AppConstants.taskSharedPrefs;
    if (prefs != null) {
      // Convert each TaskModel to JSON and store it as a list of strings
      List<String> taskList =
          tasksOffline.map((task) => jsonEncode(task.toJson())).toList();

      await prefs.setStringList('task_list', taskList);
    }
  }

  static RxList<SingleTaskData> getTasks() {
    final prefs = AppConstants.taskSharedPrefs;

    if (prefs != null) {
      var data = prefs.getStringList('task_list');

      if (data != null) {
        // Convert each JSON string back to a TaskModel object
        List<SingleTaskData> taskList = data
            .map(
                (taskString) => SingleTaskData.fromJson(jsonDecode(taskString)))
            .toList();

        return RxList<SingleTaskData>(taskList);
      }
    }

    return RxList<SingleTaskData>(); // Return an empty list if no data is found
  }

  static saveTag(List<String> tags) {
    // Save the list of tags directly to SharedPreferences
    AppConstants.taskSharedPrefs?.setStringList("tag_list", tags);
  }

  static List<String> getTag() {
    // Retrieve the list of saved tags
    var tagList = AppConstants.taskSharedPrefs?.getStringList("tag_list");

    // If no tags are saved, return an empty list
    return tagList ?? [];
  }
}
