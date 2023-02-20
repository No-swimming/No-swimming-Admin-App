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
                  fontWeight: FontWeight.bold, fontFamily: 'LINE Seed Sans KR'),
            ),
            Row(
              children: [
                Text('작성한 독서록',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LINE Seed Sans KR')),
                Text(
                  '8건',
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F)),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              width: 380.0.w,
              height: 655.0.h,
              child: ListView(),
            )
          ],
        ),
      ),
    );
  }
}
