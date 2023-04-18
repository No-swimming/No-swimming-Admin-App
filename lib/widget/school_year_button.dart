import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';
import 'package:provider/provider.dart';

class SchoolYearButton extends StatefulWidget {
  SchoolYearButton(
      {Key? key, required this.categoryText, required this.categoryNum})
      : super(key: key);
  String categoryText;
  int categoryNum;

  @override
  State<SchoolYearButton> createState() => _SchoolYearButtonState();
}

class _SchoolYearButtonState extends State<SchoolYearButton> {
  @override
  Widget build(BuildContext context) {
    SchoolListProvider schoolListProvider =
        Provider.of<SchoolListProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        setState(() {
          schoolListProvider.emptyGrageList();
          schoolListProvider.addSelectedGradeList(widget.categoryNum);
          schoolListProvider.studentList =
              getStudentList(grade: widget.categoryNum);
        });
      },
      child: Container(
        width: schoolListProvider.selectedGrade.contains(widget.categoryNum)
            ? 118.0.w
            : 72.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width:
                  schoolListProvider.selectedGrade.contains(widget.categoryNum)
                      ? 2
                      : 1,
              color:
                  schoolListProvider.selectedGrade.contains(widget.categoryNum)
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
                    color: schoolListProvider.selectedGrade
                            .contains(widget.categoryNum)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: schoolListProvider.selectedGrade
                            .contains(widget.categoryNum)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              if (schoolListProvider.selectedGrade.contains(widget.categoryNum))
                Text(
                  "72명",
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
