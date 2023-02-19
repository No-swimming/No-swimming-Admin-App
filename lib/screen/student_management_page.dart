import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentManagementPage extends StatefulWidget {
  StudentManagementPage({Key? key}) : super(key: key);

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  late List<bool> isButton;

  bool isButton0 = false;

  bool isButton1 = false;

  bool isButton2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '학생 관리',
              style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 30.0.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 68.0.w,
                  height: 38.0.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(57)),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                      child: Text(
                    '1학년',
                    style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F),
                      fontSize: 16.0.sp,
                    ),
                  )),
                ),
                SizedBox(width: 12.0.w),
                Container(
                  width: 68.0.w,
                  height: 38.0.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(57)),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                      child: Text(
                    '2학년',
                    style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F),
                      fontSize: 16.0.sp,
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
