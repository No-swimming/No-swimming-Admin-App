import 'package:no_swimming_admin_app/model/student.dart';

class StudentList {
  List<Student>? studentList;

  StudentList({this.studentList});

  factory StudentList.fromJson(List<dynamic> json) {
    List<Student> studentList = <Student>[];
    studentList = json.map((i) => Student.fromJson(i)).toList();

    return StudentList(studentList: studentList);
  }
}
