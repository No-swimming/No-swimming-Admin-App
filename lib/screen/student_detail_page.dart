import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('주영재(3602)'),
          Text('작성한 독서록 8건'),
          Divider(),
          SizedBox(
            width: 380.0.w,
            height: 655.0.h,
            child: ListView(),
          )
        ],
      ),
    );
  }
}
