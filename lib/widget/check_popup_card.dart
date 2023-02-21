import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/widget/custom_button.dart';

void checkPopupCard(context, title, bodyText, Function func) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16.0.r),
        width: 372.0.w,
        height: 170.0.h,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LINE Seed Sans KR'),
            ),
            SizedBox(height: 16.0.h),
            Text(
              bodyText,
              style: TextStyle(
                fontSize: 16.0.sp,
                fontFamily: 'LINE Seed Sans KR',
              ),
            ),
            SizedBox(height: 16.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 166.0.w,
                  height: 33.0.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Color(0xffF2F2F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '취소',
                      style: TextStyle(
                          fontFamily: 'LINE Seed Sans KR',
                          fontSize: 16.0.sp,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 8.0.w),
                CustomButtom(
                    buttonText: '확인',
                    width: 166.0,
                    height: 33.0,
                    backgroundColor: Colors.black,
                    fontSize: 16.0,
                    textColor: Colors.white),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
