import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  BookCard({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffF2F2F2),
      ),
      width: 362.0.w,
      height: 70.0.h,
      child: Padding(
        padding: EdgeInsets.all(4.0.r),
        child: Row(
          children: [
            Image.asset('assets/images/book.png',
                width: 41.0.w, height: 60.0.h),
            Padding(
              padding: EdgeInsets.only(top: 9.0.h, left: 10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0.sp,
                        fontFamily: 'LINE Seed Sans KR',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '앤디 위어 | 2021',
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
