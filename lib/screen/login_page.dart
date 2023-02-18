import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 380.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' 아이디',
                    style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0.h),
            SizedBox(
              width: 380.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' 비밀번호',
                    style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      color: Color(0xff7F7F7F),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isClicked ? isClicked = false : isClicked = true;
                            });
                          },
                          icon: isClicked
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0.h),
            SizedBox(
              width: 380.0.w,
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
                  '로그인',
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR', fontSize: 15.0.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                  child: Text(
                "계정을 발급받으려면 관리자에게 문의하십시오",
                style: TextStyle(
                  fontFamily: 'LINE Seed Sans KR',
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
