import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w, right: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주영재(3602)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'LINE Seed Sans KR',
                fontSize: 30.0.sp,
              ),
            ),
            Row(
              children: [
                Text('작성한 독서록',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0.sp,
                    )),
                Text(
                  ' 8건',
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0.sp,
                      color: Color(0xff7F7F7F)),
                ),
              ],
            ),
            SizedBox(height: 20.0.h),
            const Divider(
              thickness: 1,
              color: Color(0xffBFBFBF),
            ),
            SizedBox(
              width: 380.0.w,
              height: 725.0.h,
              child: ListView(),
            )
          ],
        ),
      ),
    );
  }
}
