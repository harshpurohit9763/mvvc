import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/extensions/fonts_extensaions.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderwidth,
    this.elevation,
    this.iconColor,
    this.icon,
    this.iconSize,
    this.onPressed,
    this.raduis,
    this.text,
    this.padding,
    this.style,
    this.width,
  });
  int? raduis;
  double? elevation;
  double? borderwidth;
  Color? borderColor;
  Color? backgroundColor;
  String? text;
  IconData? icon;
  int? iconSize;
  Color? iconColor;
  void Function()? onPressed;
  EdgeInsetsGeometry? padding;
  double? width;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(padding),
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            foregroundColor:
                const WidgetStatePropertyAll(Colors.white), //edit this
            elevation: WidgetStatePropertyAll(elevation),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  raduis != null ? raduis!.r : 5.r), // Set border radius to 5.r
              side: BorderSide(
                color: borderColor ?? Colors.grey, // Set border color
                width: borderwidth ?? 1, // Set border width
              ),
            ))),
        onPressed: onPressed,
        child: icon != null
            ? Icon(icon)
            : SizedBox(
                width: width,
                child: Text(
                  text.toString(),
                  style: style ?? GoogleFontsExtensation.buttonText,
                ),
              ));
  }
}
