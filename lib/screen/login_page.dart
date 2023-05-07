import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:no_swimming_admin_app/Model/login_response.dart';
import 'package:no_swimming_admin_app/screen/student_management_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:no_swimming_admin_app/widget/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isClicked = true;
  var storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 230.0.h, left: 20.0.w, right: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/width_app_logo.png',
                    width: 118.71.r,
                    height: 29.0.r,
                  ),
                  SizedBox(height: 8.0.h),
                  Text(
                    '로그인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0.sp,
                    ),
                  ),
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
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: TextFormField(
                              controller: idController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
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
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: isClicked ? true : false,
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
                                      ? const Icon(FluentIcons.eye_24_regular,
                                          color: Colors.grey)
                                      : const Icon(
                                          FluentIcons.eye_off_24_regular,
                                          color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0.h),
                  CustomButtom(
                    buttonText: '로그인',
                    width: 380.0,
                    height: 38.0,
                    backgroundColor: Colors.black,
                    fontSize: 17.0,
                    textColor: Colors.white,
                    func: () async {
                      // var deviceToken =
                      //     await FirebaseMessaging.instance.getToken();
                      // var data = {
                      //   "email": idController.text,
                      //   "password": passwordController.text,
                      //   "device_token": deviceToken
                      // };
                      // var body = json.encode(data);
                      // final response = await http.post(
                      //     Uri.parse('$baseurl/teacher/device-token'),
                      //     headers: {"Content-Type": "application/json"},
                      //     body: body);
                      // print(response.body);
                      // if (response.statusCode == 200) {
                      //   LoginResponse loginResponse =
                      //       LoginResponse.fromJson(jsonDecode(response.body));
                      //   storage.write(
                      //       key: 'accessToken',
                      //       value: loginResponse.accessToken);
                      //   storage.write(
                      //       key: 'access_token_exp',
                      //       value: loginResponse.accessTokenExp);
                        SchoolListProvider schoolListProvider =
                            Provider.of<SchoolListProvider>(context,
                                listen: false);
                        schoolListProvider.addStudentList();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentManagementPage()),
                            (route) => false);
                      //}
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: Center(
                      child: Text(
                        "계정을 발급받으려면 관리자에게 문의하십시오",
                        style: TextStyle(
                          fontFamily: 'LINE Seed Sans KR',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
