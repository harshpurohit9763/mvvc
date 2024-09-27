import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on EdgeInsets {
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);
  }

  static EdgeInsets fromLTRB(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(left.w, top.h, right.w, bottom.h);
  }

  static EdgeInsets all(double value) {
    return EdgeInsets.all(value.sp);
  }
}
