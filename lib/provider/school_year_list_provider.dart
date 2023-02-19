import 'package:flutter/material.dart';

class SchoolYearListProvider with ChangeNotifier {
  List<String> selectedCategory = List.empty(growable: true);

  void emptyList() {
    selectedCategory = List.empty(growable: true);
    notifyListeners();
  }

  void addList(String category) {
    selectedCategory.add(category);
    notifyListeners();
  }
}
