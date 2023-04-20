import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/school_year_button.dart';
import 'package:no_swimming_admin_app/widget/school_room_button.dart';
import 'package:no_swimming_admin_app/widget/student_card.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';

class StudentManagementPage extends StatelessWidget {
  StudentManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w),
        child: FutureBuilder(
          future: Provider.of<SchoolListProvider>(context).studentList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
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
                      SchoolYearButton(
                        categoryText: "1학년",
                        categoryNum: 1,
                        studentLength: snapshot.data!.studentList!.length,
                      ),
                      SizedBox(width: 12.0.w),
                      SchoolYearButton(
                        categoryText: "2학년",
                        categoryNum: 2,
                        studentLength: snapshot.data!.studentList!.length,
                      ),
                      SizedBox(width: 12.0.w),
                      SchoolYearButton(
                        categoryText: "3학년",
                        categoryNum: 3,
                        studentLength: snapshot.data!.studentList!.length,
                      ),
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
                    thickness: 1,
                    color: Color(0xffBFBFBF),
                    endIndent: 20,
                  ),
                  SizedBox(
                    width: 380.0.w,
                    height: 668.0.h,
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
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
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
