import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/model/student_list.dart';
import 'package:no_swimming_admin_app/service/get_student_list.dart';

class SchoolListProvider with ChangeNotifier {
  List<String> selectedGrade = List.empty(growable: true);
  List<String> selectedRoom = List.empty(growable: true);
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

  void addSelectedGradeList(String grade) {
    selectedGrade.add(grade);
    notifyListeners();
  }

  void addSelectedRoomList(String room) {
    selectedRoom.add(room);
    notifyListeners();
  }
}
