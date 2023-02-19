import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentManagementPage extends StatelessWidget {
  StudentManagementPage({Key? key}) : super(key: key);
  late List<bool> isButton;
  bool isButton0 = false;
  bool isButton1 = false;
  bool isButton2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w, bottom: 12.0.h),
            child: Text(
              '학생 관리',
              style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 30.0.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
