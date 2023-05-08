import 'dart:convert';
import 'package:no_swimming_admin_app/Model/student.dart';
import 'package:no_swimming_admin_app/Model/student_list.dart';
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentListDataSource {
  Future<StudentList> _readStudentList(
      String url, int grade, int classNum) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString(
          '${grade * 10 + classNum}', utf8.decode(response.bodyBytes));
      return StudentList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception("학생 리스트 불러 오기 실패");
    }
  }

  Future<List<Student>> readStudentList({int? grade, int? classNum}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String url = "$baseurl/student/list";
    if (grade != null) {
      if (classNum != null) {
        url = "$url?grade=$grade&classNum=$classNum";
      } else {
        url = "$url?grade=$grade";
        classNum = 0;
      }
    } else {
      grade = classNum = 0;
    }
    var a = preferences.getString('${grade * 10 + classNum}');
    if (a != null) {
      var studentList = StudentList.fromJson(jsonDecode(a));
      return studentList.studentList!;
    }
    return _readStudentList(url, grade, classNum)
        .then((value) => value.studentList!);
  }
}
