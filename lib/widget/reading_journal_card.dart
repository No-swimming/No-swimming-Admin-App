import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/book_card.dart';

class ReadingJournalCard extends StatelessWidget {
  const ReadingJournalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.0.w,
      height: 185.0.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCard(),
          Row(
            children: [
              Text('제출일'),
              Text('2023/02/23 14:22'),
            ],
          ),
          Row(
            children: [
              Text('제출 상태'),
              Text('통과'),
            ],
          ),
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
                  onPressed: () {
                  },
                  child: Text(
                    '내용 열기',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR', fontSize: 13.0.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 113.0.w,
                height: 33.0.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                      )),
                  onPressed: () {
                  },
                  child: Text(
                    '마감으로 표시',
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR', fontSize: 14.0.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
