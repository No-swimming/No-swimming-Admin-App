import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/journal_data_source.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';

class JournalRepository {
  final JournalDataSource _dataSource = JournalDataSource();

  Future<List<Journal>> searchJournalList(int userId) async =>
      await _dataSource.searchJournalList(userId);

  Future<void> closeUpJournal(int readingJournalId) async =>
      await _dataSource.closeUpJournal(readingJournalId);

  Future<void> closeUpAllJournalList(List<int> list) async =>
      await _dataSource.closeUpAllJournalList(list);
}
