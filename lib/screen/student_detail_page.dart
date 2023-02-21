import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/widget/reading_journal_card.dart';

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
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ReadingJournalCard(),
                        SizedBox(height: 12.0.h),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 183.0.w,
        height: 42.0.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              )),
          onPressed: () {
            checkPopupCard(context, '모두 마감으로 표시', '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.');
          },
          child: Text(
            '모두 마감으로 표시',
            style:
                TextStyle(fontFamily: 'LINE Seed Sans KR', fontSize: 18.0.sp),
          ),
        ),
      ),
    );
  }
}
