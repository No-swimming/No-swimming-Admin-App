import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';
import 'package:no_swimming_admin_app/Repository/journal_repository.dart';
import 'package:no_swimming_admin_app/Model/journal/detail_journal.dart';

class JournalViewModel with ChangeNotifier {
  late final JournalRepository _repository;

  List<Journal> _journalList = List.empty(growable: true);

  List<Journal> get journalList => _journalList;

  DetailJournal _detailJournal = DetailJournal();

  DetailJournal get detailJournal => _detailJournal;

  JournalViewModel() {
    _repository = JournalRepository();
    _detailJournal = DetailJournal();
  }

  Future<void> searchJournalList(int userId) async {
    _journalList = await _repository.searchJournalList(userId);
    notifyListeners();
  }

  Future<void> closeUpJournal(int readingJournalId) async {
    await _repository.closeUpJournal(readingJournalId);
    notifyListeners();
  }

  Future<void> closeUpAllJournalList(List<int> list) async {
    await _repository.closeUpAllJournalList(list);
    notifyListeners();
  }

  Future<void> getStudentDetailJournal(int readingJournalId) async {
    _detailJournal =
        await _repository.getStudentDetailJournal(readingJournalId);
    notifyListeners();
  }
}
