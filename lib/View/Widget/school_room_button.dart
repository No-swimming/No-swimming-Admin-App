import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';
import 'package:provider/provider.dart';

class SchoolRoomButton extends StatelessWidget {
  SchoolRoomButton(
      {Key? key, required this.categoryText, required this.categoryNum})
      : super(key: key);

  final String categoryText;
  final int categoryNum;

  late StudentListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<StudentListViewModel>(context);

    return InkWell(
      onTap: () {
        viewModel.selectedGrade.isEmpty
            ? null
            : viewModel.selectedRoom.isEmpty
                ? {
                    viewModel.emptyRoomList(),
                    viewModel.addSelectedRoomList(categoryNum),
                    viewModel.readStudentList(
                        grade: viewModel.selectedGrade.first,
                        classNum: categoryNum),
                    debugPrint("학년 : ${viewModel.selectedGrade.first}"),
                    debugPrint("반 : $categoryNum")
                  }
                : categoryNum == viewModel.selectedRoom.first
                    ? {
                        viewModel.emptyRoomList(),
                        viewModel.readStudentList(
                            grade: viewModel.selectedGrade.first),
                        debugPrint("학년 : ${viewModel.selectedGrade.first}"),
                        debugPrint(
                            "반 리스트 비우기: ${viewModel.selectedRoom.isEmpty}"),
                      }
                    : {
                        viewModel.emptyRoomList(),
                        viewModel.addSelectedRoomList(categoryNum),
                        viewModel.readStudentList(
                            grade: viewModel.selectedGrade.first,
                            classNum: categoryNum),
                        debugPrint("학년 : ${viewModel.selectedGrade.first}"),
                        debugPrint("반 : $categoryNum"),
                      };
      },
      child: Container(
        width: 50.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: viewModel.selectedRoom.contains(categoryNum) ? 2 : 1,
              color: viewModel.selectedRoom.contains(categoryNum)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                categoryText,
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: viewModel.selectedRoom.contains(categoryNum)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: viewModel.selectedRoom.contains(categoryNum)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
