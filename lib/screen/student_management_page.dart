import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';
import 'package:no_swimming_admin_app/widget/school_year_button.dart';
import 'package:no_swimming_admin_app/widget/school_room_button.dart';
import 'package:no_swimming_admin_app/widget/student_card.dart';
import 'package:no_swimming_admin_app/model/student_list.dart';

class StudentManagementPage extends StatefulWidget {
  StudentManagementPage({Key? key}) : super(key: key);

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  String grade1 = '1학년';
  String grade2 = '2학년';
  String grade3 = '3학년';
  String room1 = '1반';
  String room2 = '2반';
  String room3 = '3반';
  String room4 = '4반';
  Future<StudentList>? studentList;

  @override
  void initState() {
    super.initState();
    studentList = getStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                SchoolYearButton(category: grade1),
                SizedBox(width: 12.0.w),
                SchoolYearButton(category: grade2),
                SizedBox(width: 12.0.w),
                SchoolYearButton(category: grade3),
              ],
            ),
            SizedBox(height: 12.0.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SchoolRoomButton(category: room1),
                SizedBox(width: 12.0.w),
                SchoolRoomButton(category: room2),
                SizedBox(width: 12.0.w),
                SchoolRoomButton(category: room3),
                SizedBox(width: 12.0.w),
                SchoolRoomButton(category: room4),
              ],
            ),
            SizedBox(height: 20.0.h),
            const Divider(
              thickness: 1,
              color: Color(0xffBFBFBF),
              endIndent: 20,
            ),
            SizedBox(
              width: 380.0.w,
              height: 668.0.h,
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: FutureBuilder(
                  future: studentList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.studentList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              StudentCard(
                                  name: snapshot.data!.studentList![index].name
                                      .toString(),
                                  gradeNum: snapshot
                                      .data!.studentList![index].grade!
                                      .toInt(),
                                  classNum: snapshot
                                      .data!.studentList![index].classNum!
                                      .toInt(),
                                  number: snapshot
                                      .data!.studentList![index].number!
                                      .toInt()),
                              SizedBox(height: 12.0.h),
                            ],
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
