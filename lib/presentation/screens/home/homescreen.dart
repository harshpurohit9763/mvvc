import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/core/services/themes.dart';
import 'package:taskify/presentation/controllers/home_screen/home_screen_controller.dart';
import 'package:taskify/presentation/controllers/home_screen/notes_controller.dart';
import 'package:taskify/presentation/routes/app_routes_names.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  // final homeController = Get.find<HomeScreenController>();
  ThemesService themesService = Get.find<ThemesService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.82.sh,
      width: 1.0.sw,
      // color: Colors.amberAccent,
      child: SingleChildScrollView(
          child: Padding(
              padding: PaddingExtension.all(8),
              child: GetBuilder(
                init: NotesController(),
                builder: (taskcontroller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PaddingExtension.symmetric(horizontal: 8.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // homeController.selectOptionFromTop.value = index;
                                taskcontroller.isviewMode.value = false;
                                Get.toNamed(RoutesConstants.addNote);
                              },
                              child: DottedBorder(
                                borderPadding: PaddingExtension.all(4),
                                dashPattern: [10],
                                radius: Radius.circular(10.r),
                                borderType: BorderType.RRect,
                                color: themesService.isDark.value
                                    ? Colors.white
                                    : Colors.black,
                                child: Container(
                                  width: 100.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        taskcontroller.addOptionsIcons[0],
                                      ),
                                      filterQuality: FilterQuality.high,
                                      height: 45.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              taskcontroller.addOptions[0],
                              style: GoogleFontsExtensation.bodyTextMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: PaddingExtension.symmetric(vertical: 4.h),
                        child: Divider(
                          color: ColourConstants.divider,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent",
                            style: GoogleFontsExtensation.bodyTextBig,
                          ),
                          GestureDetector(
                            onTap: () {
                              taskcontroller.tasksOffline.clear();
                              taskcontroller.getAllNotes();
                              taskcontroller.update();
                            },
                            child: Image(
                              image: const AssetImage(
                                ImageConstants.refreshIcon,
                              ),
                              height: 35.h,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ],
                      ),
                      taskcontroller.tasksOffline.isEmpty
                          ? Container(
                              height: 0.5.sh,
                              width: 1.0.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      ImageConstants.snakeIcon,
                                    ),
                                    fit: BoxFit.cover,
                                    height: 0.2.sh,
                                  ),
                                  Text(
                                    "No Notes Found",
                                    style: GoogleFontsExtensation.bodyTextSmall,
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: List.generate(
                                taskcontroller.tasksOffline.length,
                                (index) {
                                  var data = taskcontroller.tasksOffline[index];
                                  return SizedBox(
                                    // width: 0.45
                                    // .sw, // Adjust width to create grid-like items (you can tweak this)
                                    child: GestureDetector(
                                      onTap: () {
                                        taskcontroller.selectedNote.value =
                                            index;
                                        taskcontroller.openNote();
                                      },
                                      child: Card(
                                        elevation: 10,
                                        // color: Colors.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    themesService.isDark.value
                                                        ? Colors.white30
                                                        : Colors.black),
                                            // color: Colors.yellow,
                                            // color: data.tileColour != null
                                            //     ? Color(data.tileColour!).withOpacity(0.5)
                                            //     : ColourConstants.bodyTextFirst
                                            //         .withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(
                                                8), // Add rounded corners if desired
                                          ),
                                          child: Padding(
                                            padding: PaddingExtension.all(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  data.title.toString(),
                                                  style: GoogleFontsExtensation
                                                      .bodyTextSmall,
                                                ),
                                                Divider(
                                                  color:
                                                      ColourConstants.divider,
                                                ),
                                                data.contentImages?.length != 0
                                                    ? SizedBox(
                                                        width: 0.91.sw,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children:
                                                                List.generate(
                                                              data.contentImages!
                                                                  .length,
                                                              (internalindex) {
                                                                return Padding(
                                                                  padding: PaddingExtension
                                                                      .fromLTRB(
                                                                          left:
                                                                              4.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                    child:
                                                                        Image(
                                                                      image:
                                                                          FileImage(
                                                                        File(data
                                                                            .contentImages?[internalindex]),
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height:
                                                                          0.1.sh,
                                                                      width: 0.3
                                                                          .sw,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                                data.contentImages?.length != 0
                                                    ? Divider(
                                                        color: ColourConstants
                                                            .divider,
                                                      )
                                                    : Container(),
                                                Text(
                                                  data.content!,
                                                  style: GoogleFontsExtensation
                                                      .miniText,
                                                  maxLines: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      //   SizedBox(
                      //     height: 0.6.sh,
                      //     child: MasonryGridView.count(
                      //       // crossAxisCount: 4,
                      //       mainAxisSpacing: 4,
                      //       crossAxisSpacing: 4,
                      //       crossAxisCount: 2,
                      //       itemCount:
                      //           homeController.taskcontroller.tasksOffline.length,
                      //       itemBuilder: (context, index) {
                      //         // var data =
                      //         //     homeController.taskcontroller.tasksOffline[index];
                      //         var data = homeController
                      //             .taskcontroller.tasksOffline.reversed
                      //             .toList()[index];
                      //         return GestureDetector(
                      //           onTap: () {
                      //             // homeController
                      //             // .taskcontroller.tasksOffline.removeAt(index);
                      //             log(index.toString());
                      //           },
                      //           child: Card(
                      //             elevation: 10,
                      //             // color: Colors.white,
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(),
                      //                 // color: Colors.yellow,
                      //                 color: data.tileColour != null
                      //                     ? Color(data.tileColour!).withOpacity(0.5)
                      //                     : ColourConstants.bodyTextFirst
                      //                         .withOpacity(0.5),
                      //                 borderRadius: BorderRadius.circular(
                      //                     8), // Add rounded corners if desired
                      //               ),
                      //               child: Padding(
                      //                 padding: PaddingExtension.fromLTRB(left: 5.w),
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   children: [
                      //                     Text(
                      //                       data.title.toString(),
                      //                       style:
                      //                           GoogleFontsExtensation.bodyTextSmall,
                      //                     ),
                      //                     Divider(
                      //                       color: ColourConstants.divider,
                      //                     ),
                      //                     data.contentImages?.length != 0
                      //                         ? ClipRRect(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10.r),
                      //                             child: Image(
                      //                                 image: FileImage(
                      //                                   File(data.contentImages?[0]),
                      //                                 ),
                      //                                 fit: BoxFit.cover,
                      //                                 height: 0.1.sh,
                      //                                 width: 0.4.sw),
                      //                           )
                      //                         : Container(),
                      //                     data.contentImages?.length != 0
                      //                         ? Divider(
                      //                             color: ColourConstants.divider,
                      //                           )
                      //                         : Container(),
                      //                     Text(
                      //                       data.content!,
                      //                       style: GoogleFontsExtensation.miniText,
                      //                       maxLines: 3,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   )
                    ],
                  );
                },
              ))),
    );
  }
}
