import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/book_card.dart';
import 'package:no_swimming_admin_app/widget/custom_button.dart';
import 'package:no_swimming_admin_app/widget/check_popup_card.dart';

class ReadingJournalCard extends StatelessWidget {
  const ReadingJournalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Color(0xffF2F2F2)),
        color: Colors.white,
      ),
      width: 380.0.w,
      height: 195.0.h,
      child: Padding(
        padding: EdgeInsets.all(9.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCard(),
            SizedBox(height: 8.0.h),
            Row(
              children: [
                Text('제출일',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold)),
                Text(
                  ' 2023/02/23 14:22',
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR', fontSize: 16.0.sp),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),
            Row(
              children: [
                Text('제출 상태',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold)),
                Text(
                  ' 통과',
                  style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),
            Row(
              children: [
                CustomButtom(
                  buttonText: '내용 열기',
                  width: 90.0,
                  height: 33.0,
                  backgroundColor: Colors.black,
                  fontSize: 14.0,
                  textColor: Colors.white,
                ),
                SizedBox(width: 8.0.w),
                CustomButtom(
                  buttonText: '마감으로 표시',
                  width: 113.0,
                  height: 33.0,
                  backgroundColor: Color(0xffF2F2F2),
                  fontSize: 14.0,
                  textColor: Colors.black,
                  func: () => checkPopupCard(context, '마감으로 표시',
                      '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.', func),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void func() => debugPrint('함수 실행');
