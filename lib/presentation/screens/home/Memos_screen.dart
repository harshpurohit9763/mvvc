import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemosScreen extends StatelessWidget {
  const MemosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
 height: 0.82.sh,
      width: 1.0.sw,
      color: Colors.amberAccent,
      child: SingleChildScrollView(
          child: Column(
        children: List.generate(
          50,
          (index) {
            return Text("Memos screen");
          },
        ),
      )),
    );
  }
}
