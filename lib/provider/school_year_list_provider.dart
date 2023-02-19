import 'package:flutter/material.dart';

class SchoolListProvider with ChangeNotifier {
  List<String> selectedGrade = List.empty(growable: true);
  List<String> selectedRoom = List.empty(growable: true);

  void emptyList(List list) {
    list = List.empty(growable: true);
    notifyListeners();
  }

  void addSelectedGradeList(String grade) {
    selectedGrade.add(grade);
    notifyListeners();
  }

  void addSelectedRoomList(String room){
    selectedRoom.add(room);
    notifyListeners();
  }
}
