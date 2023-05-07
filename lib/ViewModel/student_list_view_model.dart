import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/student.dart';
import 'package:no_swimming_admin_app/Repository/student_list_repository.dart';

class StudentListViewModel with ChangeNotifier {
  late final StudentListRepository _repository;

  List<Student> _studentList = List.empty(growable: true);

  List<Student> get studentList => _studentList;

  StudentListViewModel() {
    _repository = StudentListRepository();
    readStudentList();
  }

  Future<void> readStudentList() async {
    _studentList = await _repository.readStudentList();
    notifyListeners();
  }
}
