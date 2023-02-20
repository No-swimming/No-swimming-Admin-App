import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/book_card.dart';

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
                SizedBox(
                  width: 85.0.w,
                  height: 33.0.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        )),
                    onPressed: () {},
                    child: Text(
                      '내용 열기',
                      style: TextStyle(
                          fontFamily: 'LINE Seed Sans KR', fontSize: 13.0.sp),
                    ),
                  ),
                ),
                SizedBox(width: 8.0.w),
                SizedBox(
                  width: 113.0.w,
                  height: 33.0.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Color(0xffF2F2F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        )),
                    onPressed: () {},
                    child: Text(
                      '마감으로 표시',
                      style: TextStyle(
                          fontFamily: 'LINE Seed Sans KR',
                          fontSize: 14.0.sp,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
