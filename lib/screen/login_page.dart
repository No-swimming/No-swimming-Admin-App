import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:no_swimming_admin_app/screen/student_management_page.dart';
import 'package:no_swimming_admin_app/widget/custom_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 258.0.h, left: 20.0.w, right: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/appLogo.png',
                  width: 118.71.r,
                  height: 29.0.r,
                ),
                SizedBox(height: 8.0.h),
                Text('로그인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0.sp,
                    )),
              ],
            ),
            SizedBox(height: 34.0.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 380.0.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1, color: Colors.black12),
                        ),
                        child: const TextField(
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
                      const Text(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1, color: Colors.black12),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked
                                      ? isClicked = false
                                      : isClicked = true;
                                });
                              },
                              icon: isClicked
                                  ? const Icon(FluentIcons.eye_24_regular)
                                  : const Icon(FluentIcons.eye_off_24_regular),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0.h),
                CustomButtom(
                  buttonText: '로그인',
                  width: 380.0,
                  height: 35.0,
                  backgroundColor: Colors.black,
                  fontSize: 17.0,
                  textColor: Colors.white,
                  func: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentManagementPage()),
                      (route) => false),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0),
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
          ],
        ),
      ),
    );
  }
}
