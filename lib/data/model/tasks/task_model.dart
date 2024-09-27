// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  bool? status;
  String? message;
  SingleTaskData? data;

  TaskModel({
    this.status,
    this.message,
    this.data,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : SingleTaskData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class SingleTaskData {
  String? title;
  String? discription;
  int? tileColour;
  String? tileImage;
  List<dynamic>? contentImages;
  String? content;
  String? tags;
  String? impThought;
  String? reminder;
  List<dynamic>? todoList;
  String? createdAt;
  int? updatedAt;

  SingleTaskData({
    this.title,
    this.discription,
    this.tileColour,
    this.tileImage,
    this.tags,
    this.impThought,
    this.contentImages,
    this.reminder,
    this.content,
    this.todoList,
    this.createdAt,
    this.updatedAt,
  });

  factory SingleTaskData.fromJson(Map<String, dynamic> json) => SingleTaskData(
        title: json["Title"],
        discription: json["Discription"],
        tileColour: json["TileColour"],
        tileImage: json["TileImage"],
        tags: json["tags"],
        impThought: json["Imp-thought"],
        reminder: json["reminder"],
        content: json["content"],
        contentImages: json["ContentImages"] == null
            ? []
            : List<dynamic>.from(json["ContentImages"]!.map((x) => x)),
        todoList: json["TodoList"] == null
            ? []
            : List<dynamic>.from(json["TodoList"]!.map((x) => x)),
        createdAt: json["createdAt "],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Discription": discription,
        "TileColour": tileColour,
        "TileImage": tileImage,
        "content": content,
        "tags": tags,
        "Imp-thought": impThought,
        "reminder": reminder,
        "TodoList":
            todoList == null ? [] : List<dynamic>.from(todoList!.map((x) => x)),
        "ContentImages": contentImages == null
            ? []
            : List<dynamic>.from(contentImages!.map((x) => x)),
        "createdAt ": createdAt,
        "updatedAt": updatedAt,
      };
}
