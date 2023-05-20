import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';
import 'package:no_swimming_admin_app/Repository/journal_repository.dart';

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

  Future<void> closeUpJournal(int readingJournalId) async {
    await _repository.closeUpJournal(readingJournalId);
    notifyListeners();
  }
}
