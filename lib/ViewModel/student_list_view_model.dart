import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/student/student.dart';
import 'package:no_swimming_admin_app/Repository/student_list_repository.dart';

class StudentListViewModel with ChangeNotifier {
  late final StudentListRepository _repository;

  List<int> selectedGrade = List.empty(growable: true);
  List<int> selectedRoom = List.empty(growable: true);

  List<Student> _studentList = List.empty(growable: true);

  List<Student> get studentList => _studentList;

  StudentListViewModel() {
    _repository = StudentListRepository();
  }

  Future<void> readStudentList({int? grade, int? classNum}) async {
    _studentList =
        await _repository.readStudentList(grade: grade, classNum: classNum);
    notifyListeners();
  }

  void emptyGradeList() {
    selectedGrade = List.empty(growable: true);
    notifyListeners();
  }

  void emptyRoomList() {
    selectedRoom = List.empty(growable: true);
    notifyListeners();
  }

  void addSelectedGradeList(int grade) {
    selectedGrade.add(grade);
    notifyListeners();
  }

  void addSelectedRoomList(int room) {
    selectedRoom.add(room);
    notifyListeners();
  }
}
