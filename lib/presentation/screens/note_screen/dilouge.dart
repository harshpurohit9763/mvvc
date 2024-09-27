import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> CustomDilougetoShow(
    {required Widget content, Color? backgroundColor}) {
  return Get.defaultDialog(
      backgroundColor: backgroundColor,
      title: "",
      titleStyle: TextStyle(fontSize: 0),
      content: content);
}
