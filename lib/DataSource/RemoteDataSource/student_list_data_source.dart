import 'dart:convert';
import 'package:no_swimming_admin_app/Model/student.dart';
import 'package:no_swimming_admin_app/Model/student_list.dart';
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:http/http.dart' as http;

class StudentListDataSource {
  String url = "$baseurl/student/list";

  Future<StudentList> _readStudentList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return StudentList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception("학생 리스트 불러 오기 실패");
    }
  }

  Future<List<Student>> readStudentList() async =>
      _readStudentList().then((value) => value.studentList!);

//리스트 조회 후 로컬에 저장 하는 건 다음에 만들 예정
// Future<StudentList> readStudentList1({int? grade, int? classNum}) async {
//   int gradeNum, classNumNum;
//   final SharedPreferences preferences = await SharedPreferences.getInstance();
//   if (grade != null) {
//     if (classNum == null) {
//       url = "$url?grade=$grade";
//       classNumNum = 0;
//       gradeNum = grade;
//     } else {
//       url = "$url?grade=$grade&classNum=$classNum";
//       gradeNum = grade;
//       classNumNum = classNum;
//     }
//   } else {
//     gradeNum = classNumNum = 0;
//   }
//   if ((preferences.getString('${gradeNum * 10 + classNumNum}')) != null) {
//     return StudentList.fromJson(
//         jsonDecode(preferences.getString('${gradeNum * 10 + classNumNum}')!));
//   } else {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       print("서버 에서 받은 값");
//       await preferences.setString(
//           '${gradeNum * 10 + classNumNum}', utf8.decode(response.bodyBytes));
//       return StudentList.fromJson(
//           jsonDecode(utf8.decode(response.bodyBytes)));
//     } else {
//       throw Exception('예외');
//     }
//   }
// }
}
