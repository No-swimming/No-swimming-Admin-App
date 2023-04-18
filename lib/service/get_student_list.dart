import 'dart:convert';

import 'package:no_swimming_admin_app/model/student_list.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';

class GetStudentList {
  String url = "$baseurl/student/list";

  Future<StudentList> getStudentList({int? grade, int? classNum}) async {
    if (grade != null) {
      if (classNum == null) {
        url = "$url?grade=$grade";
      } else {
        url = "$url?grade=$grade&classNum=$classNum";
      }
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(utf8.decode(response.bodyBytes));
      return StudentList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('예외');
    }
  }
}
