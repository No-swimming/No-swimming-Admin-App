import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.0.w,
      height: 65.0.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Color(0xffF2F2F2)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/noSwimmingIcon.png',
                width: 42.0.w, height: 42.0.h),
            SizedBox(width: 8.0.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('주영재',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontWeight: FontWeight.bold)),
                Text(
                  '3학년 6반 2번',
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
