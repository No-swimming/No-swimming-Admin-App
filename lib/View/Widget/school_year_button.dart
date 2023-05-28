import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';
import 'package:provider/provider.dart';

class SchoolYearButton extends StatelessWidget {
  SchoolYearButton({
    Key? key,
    required this.categoryText,
    required this.categoryNum,
  }) : super(key: key);

  final String categoryText;
  final int categoryNum;

  late StudentListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<StudentListViewModel>(context, listen: false);
    return InkWell(
      onTap: () {
        viewModel.emptyGradeList();
        viewModel.addSelectedGradeList(categoryNum);
        viewModel.selectedRoom.isEmpty
            ? viewModel.readStudentList(grade: categoryNum)
            : viewModel.readStudentList(
                grade: categoryNum,
                classNum: viewModel.selectedRoom.first,
              );
      },
      child: Container(
        width: viewModel.selectedGrade.contains(categoryNum) ? 118.0.w : 72.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: viewModel.selectedGrade.contains(categoryNum) ? 2 : 1,
              color: viewModel.selectedGrade.contains(categoryNum)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                categoryText,
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: viewModel.selectedGrade.contains(categoryNum)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: viewModel.selectedGrade.contains(categoryNum)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              if (viewModel.selectedGrade.contains(categoryNum))
                Text(
                  "${viewModel.studentList.length}명",
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
