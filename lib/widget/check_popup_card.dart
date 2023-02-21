import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void checkPopupCard(context, title, bodyText) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
      //AlertDialog에 있는 디폴트 패딩값 제거
      content: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SizedBox(
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
              SizedBox(height: 16.0.h),
              Text(
                bodyText,
                style: TextStyle(
                    fontSize: 16.0.sp, fontFamily: 'LINE Seed Sans KR'),
              ),
              SizedBox(height: 16.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140.0.w,
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
                        '취소',
                        style:
                        TextStyle(fontFamily: 'LINE Seed Sans KR', fontSize: 16.0.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0.w),
                  SizedBox(
                    width: 140.0.w,
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
                        '확인',
                        style:
                        TextStyle(fontFamily: 'LINE Seed Sans KR', fontSize: 16.0.sp),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
