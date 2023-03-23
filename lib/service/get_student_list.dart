import 'dart:convert';

import 'package:no_swimming_admin_app/model/student_list.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';

Future<StudentList> getStudentList() async {
  final response = await http.get(Uri.parse('$baseurl/student/list'));
  if (response.statusCode == 200) {
    print(utf8.decode(response.bodyBytes));
    return StudentList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception('예외');
  }
}
