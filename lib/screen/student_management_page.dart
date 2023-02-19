import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/school_year_button.dart';

class StudentManagementPage extends StatefulWidget {
  StudentManagementPage({Key? key}) : super(key: key);

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  String category0 = '1학년';
  String category1 = '2학년';
  String category2 = '3학년';

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
                SchoolYearButton(category: category0),
                SizedBox(width: 12.0.w),
                SchoolYearButton(category: category1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
