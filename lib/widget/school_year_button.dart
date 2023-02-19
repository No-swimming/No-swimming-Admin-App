import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolYearButton extends StatefulWidget {
  SchoolYearButton({Key? key, required this.category}) : super(key: key);

  List<String> selectedCategory = List.empty(growable: true);
  String category;

  @override
  State<SchoolYearButton> createState() => _SchoolYearButtonState();
}

class _SchoolYearButtonState extends State<SchoolYearButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectedCategory = List.empty(growable: true);
          widget.selectedCategory.add(widget.category);
        });
      },
      child: Container(
        width: 68.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: widget.selectedCategory.contains(widget.category) ? 2 : 1,
              color: widget.selectedCategory.contains(widget.category)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Text(
            '1학년',
            style: TextStyle(
                fontFamily: 'LINE Seed Sans KR',
                color: widget.selectedCategory.contains(widget.category)
                    ? Colors.black
                    : Color(0xff7F7F7F),
                fontSize: 16.0.sp,
                fontWeight: widget.selectedCategory.contains(widget.category)
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
