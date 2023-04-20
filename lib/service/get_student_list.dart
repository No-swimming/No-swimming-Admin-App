import 'dart:convert';

import 'package:no_swimming_admin_app/model/student_list.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<StudentList> getStudentList({int? grade, int? classNum}) async {
  String url = "$baseurl/student/list";
  int gradeNum, classNumNum;
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  if (grade != null) {
    if (classNum == null) {
      url = "$url?grade=$grade";
      classNumNum = 0;
      gradeNum = grade;
    } else {
      url = "$url?grade=$grade&classNum=$classNum";
      gradeNum = grade;
      classNumNum = classNum;
    }
  } else {
    gradeNum = classNumNum = 0;
  }
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print(utf8.decode(response.bodyBytes));
    return StudentList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception('예외');
  }
}
