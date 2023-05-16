import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/search_journal_list_data_source.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';

class SearchJournalListRepository {
  final SearchJournalListDataSource _dataSource = SearchJournalListDataSource();

  Future<List<Journal>> searchJournalList(int userId) async =>
      _dataSource.searchJournalList(userId);
}
