import 'package:flutter/material.dart';

class SchoolListProvider with ChangeNotifier {
  List<String> selectedGrade = ["1학년"];
  List<String> selectedRoom = ["1반"];

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

  void addSelectedRoomList(String room){
    selectedRoom.add(room);
    notifyListeners();
  }
}
