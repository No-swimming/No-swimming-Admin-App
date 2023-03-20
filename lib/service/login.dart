import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/model/login_response.dart';
import 'package:no_swimming_admin_app/baseurl.dart';

Future<LoginResponse> login(String email, String password) async {
  var deviceToken = await FirebaseMessaging.instance.getToken();
  final response = await http.post(Uri.parse('$baseurl/teacher/device-token'),
      body: {
        "email": email,
        "password": password,
        "device_token": deviceToken
      });
  print(response.body);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("로그인 실패");
  }
}
