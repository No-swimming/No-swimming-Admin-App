import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentManagementPage extends StatelessWidget {
  const StudentManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w),
            child: Text(
              '학생 관리',
              style: TextStyle(fontFamily: 'LINE Seed Sans KR',
              fontSize: 30.0.sp,
              fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
