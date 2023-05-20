import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Widget/book_card.dart';
import 'package:no_swimming_admin_app/View/Widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/View/Widget/custom_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0.w, top: 70.0.h, right: 20.0.w),
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
              BookCard(title: widget.title),
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
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0.w),
                  child: TextFormField(
                    controller: controller,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButtom(
                    buttonText: '통과로 표시',
                    width: 140.0,
                    height: 42.0,
                    backgroundColor: Colors.black,
                    fontSize: 19.0,
                    textColor: Colors.white,
                    func: () => checkPopupCard(
                        context: context,
                        title: '통과로 표시',
                        bodyText: '독서록 상태를 통과로 표시할까요?',
                        func: func),
                  ),
                  SizedBox(width: 8.0.w),
                  CustomButtom(
                    buttonText: '피드백 전송',
                    width: 140.0,
                    height: 42.0,
                    backgroundColor: Color(0xffF2F2F2),
                    fontSize: 19.0,
                    textColor: Colors.black,
                    func: () => checkPopupCard(
                        context: context,
                        title: '피드백 전송',
                        bodyText: '학생에게 피드백을 전송할까요?',
                        func: func),
                  ),
                ],
              ),
              SizedBox(height: 8.0.h),
              CustomButtom(
                buttonText: '마감으로 표시',
                width: 150.0,
                height: 42.0,
                backgroundColor: Color(0xffF2F2F2),
                fontSize: 19.0,
                textColor: Colors.black,
                func: () => checkPopupCard(
                    context: context,
                    title: '마감으로 표시',
                    bodyText: '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.',
                    func: func),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void func() => debugPrint('함수 실행');
