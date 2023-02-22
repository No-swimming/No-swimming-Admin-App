import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/book_card.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w, right: 20.0.w),
        child: Column(
          children: [
            Text('독서록 확인'),
            Text('선택한 책'),
            BookCard(),
            Text('담당 선생님'),
            Text('박생선(saengSun88'),
            const Divider(
              thickness: 1,
              color: Color(0xffBFBFBF),
            ),
            Text('나의 라임'),
            Text('대충 학생이 써놓은 글'),
            Text('7단어 44글자 공백 제외 36글자'),
            const Divider(
              thickness: 1,
              color: Color(0xffBFBFBF),
            ),
            Text('피드백'),
            Text('감동적이다'),
          ],
        ),
      ),
    );
  }
}
