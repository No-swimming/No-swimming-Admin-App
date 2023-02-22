import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom(
      {Key? key,
      required this.buttonText,
      required this.width,
      required this.height,
      required this.backgroundColor,
      required this.fontSize,
      required this.textColor,
      required this.func})
      : super(key: key);

  String buttonText;
  double width;
  double height;
  double fontSize;
  Color backgroundColor;
  Color textColor;
  VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            )),
        onPressed: () {
          func();
        },
        child: Text(
          buttonText,
          style: TextStyle(
              fontFamily: 'LINE Seed Sans KR',
              fontSize: fontSize.sp,
              color: textColor),
        ),
      ),
    );
  }
}
