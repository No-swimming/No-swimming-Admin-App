import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolYearButton extends StatefulWidget {
  const SchoolYearButton({Key? key}) : super(key: key);

  @override
  State<SchoolYearButton> createState() => _SchoolYearButtonState();
}

class _SchoolYearButtonState extends State<SchoolYearButton> {

  List<String> selectedCategory = List.empty(growable: true);
  String category0 = '1학년';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = List.empty(growable: true);
          selectedCategory.add(category0);
        });
      },
      child: Container(
        width: 68.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: selectedCategory.contains(category0) ? 2 : 1,
              color: selectedCategory.contains(category0)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Text(
            '1학년',
            style: TextStyle(
                fontFamily: 'LINE Seed Sans KR',
                color: selectedCategory.contains(category0)
                    ? Colors.black
                    : Color(0xff7F7F7F),
                fontSize: 16.0.sp,
                fontWeight: selectedCategory.contains(category0)
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
        ),
      ),
    )
    ,
  }
}
