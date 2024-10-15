import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskify/core/constants/app_constants.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';
import 'package:taskify/core/constants/extensions/padding_extensions.dart';
import 'package:taskify/core/constants/image_constant.dart';
import 'package:taskify/presentation/controllers/home_screen/notes_controller.dart';
import 'package:taskify/presentation/widgets/dilouge.dart';
import 'package:taskify/presentation/widgets/ElevatedButton.dart';
import 'package:taskify/presentation/widgets/text_form_filed.dart';

class TagScreen extends StatelessWidget {
  TagScreen({super.key});
  final notesController = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tags"),
            GestureDetector(
              onTap: () {
                CustomDilougetoShow(
                    content: Column(
                  children: [
                    Text(
                      "Add Tag",
                      style: GoogleFontsExtensation.headingMid,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      text: "Enter Tag",
                      controller: notesController.tag,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomElevatedButton(
                      padding: PaddingExtension.symmetric(
                          vertical: 8, horizontal: 12),
                      text: "Add",
                      onPressed: () {
                        notesController.saveTag();
                      },
                      style: GoogleFontsExtensation.buttonTextBold,
                      backgroundColor: ColourConstants.buttonColor,
                    )
                  ],
                ));
              },
              child: Image(
                  image: const AssetImage(
                    ImageConstants.addIcon,
                  ),
                  height: AppConstants.iconSizesmall),
            )
          ],
        ),
      ),
      body: GetBuilder(
          init: NotesController(),
          builder: (cntrl) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  notesController.tagsList.length,
                  (index) {
                    return Padding(
                      padding: PaddingExtension.symmetric(
                          vertical: 4, horizontal: 4),
                      child: Card(
                        elevation: 10,
                        child: Container(
                            width: 1.0.sw,
                            decoration: BoxDecoration(
                              color: notesController
                                  .getRandomColor()
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: PaddingExtension.symmetric(
                                vertical: 10, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notesController.tagsList[index],
                                  style: GoogleFontsExtensation.bodyTextMedium,
                                ),
                                IconButton(
                                    onPressed: () {
                                      notesController.deleteTag(index);
                                    },
                                    icon: Image.asset(
                                      ImageConstants.trashIcon,
                                      height: AppConstants.iconSizesmall,
                                    ))
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}
