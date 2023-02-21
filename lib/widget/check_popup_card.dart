import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void checkPopupCard(context, title, bodyText) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          width: 372.0.w,
          height: 155.0.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text('피드백 전송'),
              Text('ㅈㅅ ㄱㄱ?'),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('취소')),
                  ElevatedButton(onPressed: () {}, child: Text('확인')),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
