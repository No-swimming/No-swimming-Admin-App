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

  void searchJournalList(int userId) {
    List<Journal> list = List.empty(growable: true);
    list.add(Journal(
        bookId: 1,
        bookNum: 1,
        title: "이펙티브 코틀린",
        readingJournalType: "SAVE",
        readingJournalId: 1,
        recordReject: false));
    list.add(Journal(
        bookId: 2,
        bookNum: 124,
        title: "돼지책",
        readingJournalType: "SAVE",
        readingJournalId: 2,
        recordReject: false));
    _journalList = list;
    //_journalList = await _repository.searchJournalList(userId);
    //notifyListeners();
  }

  Future<void> closeUpJournal(int readingJournalId) async {
    await _repository.closeUpJournal(readingJournalId);
    //notifyListeners();
  }

  Future<void> closeUpAllJournalList(List<int> list) async {
    await _repository.closeUpAllJournalList(list);
    //notifyListeners();
  }

  Future<void> getStudentDetailJournal(int readingJournalId) async {
    _detailJournal =
        await _repository.getStudentDetailJournal(readingJournalId);
    //notifyListeners();
  }
}
