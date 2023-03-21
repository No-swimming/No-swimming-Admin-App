import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/model/login_response.dart';
import 'package:no_swimming_admin_app/baseurl.dart';

Future<LoginResponse> login(String email, String password) async {
  var deviceToken = await FirebaseMessaging.instance.getToken();
  var data = {
    "email": email,
    "password": password,
    "device_token": deviceToken
  };
  var body = json.encode(data);
  final response = await http.post(Uri.parse('$baseurl/teacher/device-token'),
      headers: {"Content-Type": "application/json"}, body: body);
  print(response.body);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("로그인 실패");
  }
}
