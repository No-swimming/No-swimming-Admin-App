import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';
import 'package:no_swimming_admin_app/Repository/search_journal_list_repository.dart';

class SearchJournalListViewModel with ChangeNotifier {
  late final SearchJournalListRepository _repository;

  List<Journal> _journalList = List.empty(growable: true);

  List<Journal> get journalList => _journalList;

  SearchJournalListViewModel() {
    _repository = SearchJournalListRepository();
  }

  Future<void> searchJournalList(int userId) async {
    _journalList = await _repository.searchJournalList(userId);
    notifyListeners();
  }
}
