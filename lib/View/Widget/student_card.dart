import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Screen/student_detail_page.dart';

class StudentCard extends StatelessWidget {
  StudentCard(
      {Key? key,
      required this.name,
      required this.gradeNum,
      required this.classNum,
      required this.number,
      required this.userId})
      : super(key: key);

  String name;
  int gradeNum, classNum, number, userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailPage(
                studentName: name,
                gradeNum: gradeNum,
                classNum: classNum,
                userId: userId,
                number: number),
          ),
        );
      },
      child: Container(
        width: 380.0.w,
        height: 75.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Color(0xffF2F2F2)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.w, top: 12.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/noSwimmingIcon.png',
                  width: 42.0.w, height: 42.0.h),
              SizedBox(width: 8.0.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0.r),
                  ),
                  Text(
                    '$gradeNum학년 $classNum반 $number번',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0.r),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
