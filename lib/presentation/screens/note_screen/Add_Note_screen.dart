import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/presentation/controllers/home_screen/notes_controller.dart';
import 'package:taskify/presentation/screens/note_screen/dilouge.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  // final homeController = Get.find<HomeScreenController>();
  GlobalKey<FormState> notesKey = GlobalKey<FormState>();
  NotesController notescontroller = Get.find<NotesController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => notescontroller.isloading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: notesKey,
              child: Container(
                height: 0.8.sh,
                width: 1.0.sw,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  notescontroller.closenote();
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              Row(
                                children: [
                                  notescontroller.isviewMode.value
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                      : Container(),
                                  notescontroller.isviewMode.value
                                      ? IconButton(
                                          onPressed: () {
                                            notescontroller.isEditMode.value ==
                                                true;
                                            notescontroller.update();
                                          },
                                          icon: Image(
                                            image: AssetImage(
                                                ImageConstants.editIcon),
                                            height: AppConstants.iconSizesmall,
                                          ))
                                      : Container(),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          onTap: () {
                                            notescontroller.filePicker();
                                          },
                                          child: const Text(
                                            "Add Images",
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            notescontroller.tagsList.isEmpty
                                                ? EasyLoading.showInfo(
                                                    "No Tags Available Add Some In Settings")
                                                : CustomDilougetoShow(
                                                    content: Wrap(
                                                      runSpacing: 5.w,
                                                      spacing: 8.w,
                                                      children: List.generate(
                                                        notescontroller
                                                            .tagsList.length,
                                                        (internal) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              notescontroller
                                                                      .tag
                                                                      .text =
                                                                  notescontroller
                                                                          .tagsList[
                                                                      internal];
                                                              Get.back();
                                                            },
                                                            child: DottedBorder(
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              radius: Radius
                                                                  .circular(
                                                                      15.r),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.r),
                                                                  color: Color(
                                                                      int.parse(
                                                                          "0xFFFF${internal + 3}${internal + 4}${internal + 5}${internal + 6}")),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      PaddingExtension
                                                                          .all(
                                                                              4),
                                                                  child: Text(
                                                                    notescontroller
                                                                            .tagsList[
                                                                        internal],
                                                                    style: GoogleFontsExtensation
                                                                        .bodyTextMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                          },
                                          child: const Text(
                                            "Add Tag",
                                          ),
                                        ),
                                        const PopupMenuItem(
                                            child: Text("Select Tile Colour")),
                                      ];
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              contentPadding:
                                  PaddingExtension.fromLTRB(left: 5.w),
                              hintText: "Title",
                              hintStyle: GoogleFontsExtensation.otherTextBig,
                            ),
                            // maxLines: null,
                            controller: notescontroller.title,
                            // overflow: TextOverflow.ellipsis
                          ),
                          Container(
                            // height: 0.6.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            width: 1.0.sw,
                            child: Column(
                              children: [
                                notescontroller.imagesPath.isNotEmpty
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: List.generate(
                                            notescontroller.imagesPath.length,
                                            (index) {
                                              return Padding(
                                                padding:
                                                    PaddingExtension.symmetric(
                                                        horizontal: 4.h,
                                                        vertical: 8.h),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  child: Stack(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (notescontroller
                                                              .isviewMode
                                                              .value) {
                                                            CustomDilougetoShow(
                                                                backgroundColor:
                                                                    const Color
                                                                        .fromARGB(
                                                                        0,
                                                                        200,
                                                                        7,
                                                                        7),
                                                                content:
                                                                    SizedBox(
                                                                  width: 0.8.sw,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            25.h,
                                                                        color: Colors
                                                                            .black,
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          child:
                                                                              Row(
                                                                            children:
                                                                                List.generate(
                                                                              120,
                                                                              (index) => Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Container(
                                                                                  color: Colors.white,
                                                                                  height: 10.h,
                                                                                  width: 10.h,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          children:
                                                                              List.generate(
                                                                            notescontroller.imagesPath.length,
                                                                            (index) =>
                                                                                Padding(
                                                                              padding: PaddingExtension.symmetric(horizontal: 8.w),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(10.r),
                                                                                child: Image(
                                                                                  image: FileImage(
                                                                                    File(notescontroller.imagesPath[index]),
                                                                                  ),
                                                                                  fit: BoxFit.cover,
                                                                                  height: 0.3.sh,
                                                                                  width: 0.6.sw,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            PaddingExtension.fromLTRB(bottom: 4.h),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              25.h,
                                                                          color:
                                                                              Colors.black,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            physics:
                                                                                NeverScrollableScrollPhysics(),
                                                                            child:
                                                                                Row(
                                                                              children: List.generate(
                                                                                120,
                                                                                (index) => Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Container(
                                                                                    color: Colors.white,
                                                                                    height: 10.h,
                                                                                    width: 10.h,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                          }
                                                        },
                                                        child: Image(
                                                          image: FileImage(
                                                            File(notescontroller
                                                                    .imagesPath[
                                                                index]),
                                                          ),
                                                          fit: BoxFit.cover,
                                                          height: 0.2.sh,
                                                          width: 150.w,
                                                        ),
                                                      ),
                                                      notescontroller
                                                              .isviewMode.value
                                                          ? Container()
                                                          : Positioned(
                                                              top: 10.h,
                                                              right: 10.w,
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        notescontroller
                                                                            .imagesPath
                                                                            .removeAt(index);
                                                                        notescontroller
                                                                            .update();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        size: 25
                                                                            .sp,
                                                                        color: Colors
                                                                            .red,
                                                                      )))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    : Container(),
                                Divider(
                                  height: 0.03.sh,
                                  color: ColourConstants.divider,
                                ),
                                Container(
                                  height: 0.5.sh,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      contentPadding:
                                          PaddingExtension.fromLTRB(left: 5.w),
                                      hintText: "Write Something...",
                                      hintStyle:
                                          GoogleFontsExtensation.bodyTextMedium,
                                    ),
                                    maxLines: null,
                                    controller: notescontroller.content,

                                    // overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.miniCenterDocked,
                  floatingActionButton: GestureDetector(
                    onTap: () {
                      if (notesKey.currentState!.validate()) {
                        notescontroller.addNoteToStorage();
                        notescontroller.update();
                      }
                    },
                    child: Container(
                      width: 1.0.sw,
                      height: 0.05.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          color: ColourConstants.buttonColor),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              notescontroller.isEditMode.value
                                  ? "update"
                                  : "Save",
                              style: GoogleFontsExtensation.buttonTextBold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image(
                              image: AssetImage(
                                notescontroller.isEditMode.value
                                    ? ImageConstants.checkIcon
                                    : notescontroller.addOptionsIcons[1],
                              ),
                              height: 25.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
