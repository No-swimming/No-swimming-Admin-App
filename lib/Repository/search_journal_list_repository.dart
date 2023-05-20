import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/journal_data_source.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';

class JournalRepository {
  final JournalDataSource _dataSource = JournalDataSource();

  Future<List<Journal>> searchJournalList(int userId) async =>
      _dataSource.searchJournalList(userId);
}
