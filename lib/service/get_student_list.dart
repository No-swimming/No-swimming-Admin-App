import 'dart:convert';

import 'package:no_swimming_admin_app/model/student_list.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<StudentList> getStudentList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('access_token');
  final response = await http.get(Uri.parse('$baseurl/student/list'),
      headers: {'Bearer Token': token.toString()});
  print(response.body);
  if (response.statusCode == 200) {
    return StudentList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('예외');
  }
}
