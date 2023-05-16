import 'package:no_swimming_admin_app/Model/student/student.dart';

class StudentList {
  List<Student>? studentList;

  StudentList({this.studentList});

  StudentList.fromJson(Map<String, dynamic> json) {
    if (json['student_list'] != null) {
      studentList = <Student>[];
      json['student_list'].forEach((v) {
        studentList!.add(Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (studentList != null) {
      data['student_list'] = studentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
