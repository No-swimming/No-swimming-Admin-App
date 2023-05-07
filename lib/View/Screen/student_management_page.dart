import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Widget/school_year_button.dart';
import 'package:no_swimming_admin_app/View/Widget/school_room_button.dart';
import 'package:no_swimming_admin_app/View/Widget/student_card.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';

class StudentManagementPage extends StatelessWidget {
  StudentManagementPage({Key? key}) : super(key: key);

  late StudentListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<StudentListViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 20.0.w, top: 70.0.h, right: 20.0.w),
        child: viewModel.studentList.isNotEmpty
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
                      SchoolYearButton(
                        categoryText: "1학년",
                        categoryNum: 1,
                        studentLength: 0,
                      ),
                      SizedBox(width: 12.0.w),
                      SchoolYearButton(
                        categoryText: "2학년",
                        categoryNum: 2,
                        studentLength: 0,
                      ),
                      SizedBox(width: 12.0.w),
                      SchoolYearButton(
                        categoryText: "3학년",
                        categoryNum: 3,
                        studentLength: 0,
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
                    thickness: 1.5,
                    color: Color(0xffBFBFBF),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: viewModel.studentList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              StudentCard(
                                  name: viewModel.studentList[index].name
                                      .toString(),
                                  gradeNum: viewModel.studentList[index].grade!
                                      .toInt(),
                                  classNum: viewModel
                                      .studentList[index].classNum!
                                      .toInt(),
                                  number: viewModel.studentList[index].number!
                                      .toInt()),
                              SizedBox(height: 12.0.h),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
