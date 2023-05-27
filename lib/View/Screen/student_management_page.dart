import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Widget/school_year_button.dart';
import 'package:no_swimming_admin_app/View/Widget/school_room_button.dart';
import 'package:no_swimming_admin_app/View/Widget/student_card.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';

class StudentManagementPage extends StatelessWidget {
  const StudentManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<StudentListViewModel>(
        builder: (context, value, child) => Container(
          margin: EdgeInsets.only(left: 20.0.w, top: 70.0.h, right: 20.0.w),
          child: value.studentList != null
              ? Column(
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
                        SchoolYearButton(categoryText: "1학년", categoryNum: 1),
                        SizedBox(width: 12.0.w),
                        SchoolYearButton(categoryText: "2학년", categoryNum: 2),
                        SizedBox(width: 12.0.w),
                        SchoolYearButton(categoryText: "3학년", categoryNum: 3),
                      ],
                    ),
                    SizedBox(height: 12.0.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SchoolRoomButton(categoryText: "1반", categoryNum: 1),
                        SizedBox(width: 12.0.w),
                        SchoolRoomButton(categoryText: "2반", categoryNum: 2),
                        SizedBox(width: 12.0.w),
                        SchoolRoomButton(categoryText: "3반", categoryNum: 3),
                        SizedBox(width: 12.0.w),
                        SchoolRoomButton(categoryText: "4반", categoryNum: 4),
                      ],
                    ),
                    SizedBox(height: 20.0.h),
                    const Divider(
                      thickness: 1.5,
                      color: Color(0xffBFBFBF),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: Consumer<StudentListViewModel>(
                          builder: (context, value, child) => ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: value.studentList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  StudentCard(
                                    name: value.studentList[index].name
                                        .toString(),
                                    gradeNum:
                                        value.studentList[index].grade!.toInt(),
                                    classNum: value.studentList[index].classNum!
                                        .toInt(),
                                    number: value.studentList[index].number!
                                        .toInt(),
                                    userId: value.studentList[index].userId!
                                        .toInt(),
                                    profileNum: value
                                        .studentList[index].profileNum!
                                        .toInt(),
                                  ),
                                  SizedBox(height: 12.0.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
