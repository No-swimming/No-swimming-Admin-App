import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/feedback_data_source.dart';

class FeedbackRepository {
  final FeedbackDataSource _dataSource = FeedbackDataSource();

  Future<void> sendJournalFeedback(
          int readingJournalId, String feedback) async =>
      _dataSource.sendJournalFeedback(readingJournalId, feedback);
}
