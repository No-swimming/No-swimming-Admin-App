import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:provider/provider.dart';

class SchoolYearButton extends StatefulWidget {
  SchoolYearButton({Key? key, required this.category}) : super(key: key);
  String category;

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
          schoolListProvider.addSelectedGradeList(widget.category);
        });
      },
      child: Container(
        width: schoolListProvider.selectedGrade.contains(widget.category)
            ? 118.0.w
            : 72.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: schoolListProvider.selectedGrade.contains(widget.category)
                  ? 2
                  : 1,
              color: schoolListProvider.selectedGrade.contains(widget.category)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.category.toString(),
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: schoolListProvider.selectedGrade
                            .contains(widget.category)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: schoolListProvider.selectedGrade
                            .contains(widget.category)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              if (schoolListProvider.selectedGrade.contains(widget.category))
                Text(
                  '72명',
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
