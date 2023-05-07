import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/student_list.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';

class SchoolListProvider with ChangeNotifier {
  List<int> selectedGrade = List.empty(growable: true);
  List<int> selectedRoom = List.empty(growable: true);
  Future<StudentList>? studentList;

  void addStudentList() {
    studentList = getStudentList();
    notifyListeners();
  }

  void emptyGrageList() {
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
