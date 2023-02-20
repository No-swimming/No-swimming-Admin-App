import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.0.w,
      height: 68.0.h,
      child: Row(
        children: [
          Image.asset('assets/images/book.png', width: 41.0.w, height: 60.0.h),
          Center(
            child: Column(
              children: [
                Text(
                  '프로젝트 헤일메리',
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
    );
  }
}
