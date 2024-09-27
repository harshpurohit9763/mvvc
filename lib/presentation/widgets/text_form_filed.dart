import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/colour_constants.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.style,
    this.fillColor,
    this.suffixIcon,
    this.islabel = true,
    this.enabled = true,
    this.suffixpresent = false,
  });
  String text;
  TextEditingController controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? style;
  Color? fillColor;
  bool? islabel;
  bool? enabled;
  bool? suffixpresent;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: validator,
      inputFormatters: inputFormatters,
      cursorHeight: 15.h,
      decoration: InputDecoration(
        // fillColor: fillColor ?? ColourConstants.bodyTextSecond,
        // filled: true,
        hintText: islabel == true ? null : text,
        hintStyle: GoogleFontsExtensation.otherTextMedium,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: ColourConstants.divider)),
        label: islabel == true
            ? Text(
                text,
                style: style ?? GoogleFontsExtensation.bodyTextSmall,
              )
            : null,
        suffixIcon: suffixpresent == true ? suffixIcon : null,
      ),
      controller: controller,
      style: style ?? GoogleFontsExtensation.bodyTextSmall,
      onChanged: onChanged,
    );
  }
}
