import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/book_card.dart';
import 'package:no_swimming_admin_app/widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/widget/custom_button.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70.0.h, left: 20.0.w, right: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '독서록 확인',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 30.0.sp,
                ),
              ),
              SizedBox(height: 22.0.h),
              Text(
                ' 선택한 책',
                style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 16.0.sp,
                  color: Color(0xff7F7F7F),
                ),
              ),
              BookCard(),
              SizedBox(height: 11.0.h),
              Text(
                ' 담당 선생님',
                style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 16.0.sp,
                  color: Color(0xff7F7F7F),
                ),
              ),
              Text(
                '박생선(saengSun88)',
                style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 20.0.sp,
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffBFBFBF),
              ),
              Text(
                '나의 라임',
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text('대충 학생이 써놓은 글'),
              Text('7단어 44글자 공백 제외 36글자'),
              const Divider(
                thickness: 1,
                color: Color(0xffBFBFBF),
              ),
              SizedBox(height: 20.0.h),
              Text(
                ' 피드백',
                style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                  fontSize: 16.0.sp,
                  color: Color(0xff7F7F7F),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 12.0.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButtom(
                    buttonText: '통과로 표시',
                    width: 125.0,
                    height: 42.0,
                    backgroundColor: Colors.black,
                    fontSize: 19.0,
                    textColor: Colors.white,
                    func: () => checkPopupCard(
                        context, '통과로 표시', '독서록 상태를 통과로 표시할까요?', func),
                  ),
                  SizedBox(width: 8.0.w),
                  CustomButtom(
                    buttonText: '피드백 전송',
                    width: 125.0,
                    height: 42.0,
                    backgroundColor: Color(0xffF2F2F2),
                    fontSize: 19.0,
                    textColor: Colors.black,
                    func: () => checkPopupCard(
                        context, '피드백 전송', '학생에게 피드백을 전송할까요?', func),
                  ),
                ],
              ),
              SizedBox(height: 8.0.h),
              CustomButtom(
                buttonText: '마감으로 표시',
                width: 143.0,
                height: 42.0,
                backgroundColor: Color(0xffF2F2F2),
                fontSize: 19.0,
                textColor: Colors.black,
                func: () => checkPopupCard(
                    context, '마감으로 표시', '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.', func),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void func() => debugPrint('함수 실행');
