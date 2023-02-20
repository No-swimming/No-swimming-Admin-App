import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.0.w,
      height: 58.0.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/noSwimmingIcon.png',
              width: 42.0.w, height: 42.0.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('주영재'),
              Text('3학년 6반 2번'),
            ],
          ),
        ],
      ),
    );
  }
}
