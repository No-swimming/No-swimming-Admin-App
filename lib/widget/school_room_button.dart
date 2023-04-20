import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';

class SchoolRoomButton extends StatefulWidget {
  SchoolRoomButton(
      {Key? key, required this.categoryText, required this.categoryNum})
      : super(key: key);

  String categoryText;
  int categoryNum;

  @override
  State<SchoolRoomButton> createState() => _SchoolRoomButtonState();
}

class _SchoolRoomButtonState extends State<SchoolRoomButton> {
  @override
  Widget build(BuildContext context) {
    SchoolListProvider schoolListProvider =
        Provider.of<SchoolListProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        schoolListProvider.selectedGrade.isEmpty
            ? null
            : schoolListProvider.selectedRoom.isEmpty
                ? setState(() {
                    schoolListProvider.emptyRoomList();
                    schoolListProvider.addSelectedRoomList(widget.categoryNum);
                    schoolListProvider.studentList = getStudentList(
                        grade: schoolListProvider.selectedGrade.first,
                        classNum: widget.categoryNum);
                    print("학년 : ${schoolListProvider.selectedGrade.first}");
                    print("반 : ${widget.categoryNum}");
                  })
                : widget.categoryNum == schoolListProvider.selectedRoom.first
                    ? setState(() {
                        schoolListProvider.emptyRoomList();
                        schoolListProvider.studentList = getStudentList(
                            grade: schoolListProvider.selectedGrade.first);
                        print("학년 : ${schoolListProvider.selectedGrade.first}");
                        print(
                            "반 리스트 비우기: ${schoolListProvider.selectedRoom.isEmpty}");
                      })
                    : setState(() {
                        schoolListProvider.emptyRoomList();
                        schoolListProvider
                            .addSelectedRoomList(widget.categoryNum);
                        schoolListProvider.studentList = getStudentList(
                            grade: schoolListProvider.selectedGrade.first,
                            classNum: widget.categoryNum);
                        print("학년 : ${schoolListProvider.selectedGrade.first}");
                        print("반 : ${widget.categoryNum}");
                      });
      },
      child: Container(
        width: 50.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width:
                  schoolListProvider.selectedRoom.contains(widget.categoryNum)
                      ? 2
                      : 1,
              color:
                  schoolListProvider.selectedRoom.contains(widget.categoryNum)
                      ? Colors.black
                      : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.categoryText,
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: schoolListProvider.selectedRoom
                            .contains(widget.categoryNum)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: schoolListProvider.selectedRoom
                            .contains(widget.categoryNum)
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
