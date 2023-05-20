import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';
import 'package:no_swimming_admin_app/Repository/search_journal_list_repository.dart';

class JournalViewModel with ChangeNotifier {
  late final JournalRepository _repository;

  List<Journal> _journalList = List.empty(growable: true);

  List<Journal> get journalList => _journalList;

  JournalViewModel() {
    _repository = JournalRepository();
  }

  Future<void> searchJournalList(int userId) async {
    _journalList = await _repository.searchJournalList(userId);
    notifyListeners();
  }
}
