import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void checkPopupCard(context, title, bodyText) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
      //AlertDialog에 있는 디폴트 패딩값 제거
      content: SizedBox(
        width: 372.0.w,
        height: 155.0.h,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0.sp,
                  fontFamily: 'LINE Seed Sans KR'),
            ),
            Text(
              bodyText,
              style:
                  TextStyle(fontSize: 16.0.sp, fontFamily: 'LINE Seed Sans KR'),
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('취소')),
                ElevatedButton(onPressed: () {}, child: Text('확인')),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
