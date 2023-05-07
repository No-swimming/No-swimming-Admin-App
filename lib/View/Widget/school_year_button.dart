import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';
import 'package:provider/provider.dart';

class SchoolYearButton extends StatefulWidget {
  SchoolYearButton(
      {Key? key,
      required this.categoryText,
      required this.categoryNum,
      required this.studentLength})
      : super(key: key);
  String categoryText;
  int categoryNum, studentLength;

  @override
  State<SchoolYearButton> createState() => _SchoolYearButtonState();
}

class _SchoolYearButtonState extends State<SchoolYearButton> {
  late StudentListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<StudentListViewModel>(context);
    return InkWell(
      onTap: () {
        setState(() {
          viewModel.emptyGrageList();
          viewModel.addSelectedGradeList(widget.categoryNum);
          // viewModel.selectedRoom.isEmpty
          //     ? viewModel.studentList =
          //         getStudentList(grade: widget.categoryNum)
          //     : viewModel.studentList = getStudentList(
          //         grade: widget.categoryNum,
          //         classNum: viewModel.selectedRoom.first);
          print("학년 : ${viewModel.selectedGrade.first}");
          if (viewModel.selectedRoom.isNotEmpty) {
            print("반 : ${viewModel.selectedRoom.first}");
          }
        });
      },
      child: Container(
        width: viewModel.selectedGrade.contains(widget.categoryNum)
            ? 118.0.w
            : 72.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width:
                  viewModel.selectedGrade.contains(widget.categoryNum)
                      ? 2
                      : 1,
              color:
                  viewModel.selectedGrade.contains(widget.categoryNum)
                      ? Colors.black
                      : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.categoryText,
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: viewModel.selectedGrade
                            .contains(widget.categoryNum)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: viewModel.selectedGrade
                            .contains(widget.categoryNum)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              if (viewModel.selectedGrade.contains(widget.categoryNum))
                Text(
                  "${widget.studentLength}명",
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: const Color(0xff7F7F7F),
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.normal),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
