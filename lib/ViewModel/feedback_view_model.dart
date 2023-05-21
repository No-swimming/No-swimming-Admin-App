import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Repository/feedback_repository.dart';

class FeedbackViewModel with ChangeNotifier {
  late final FeedbackRepository _repository;

  FeedbackViewModel() {
    _repository = FeedbackRepository();
  }

  Future<void> sendJournalFeedback(
      int readingJournalId, String feedback) async {
    _repository.sendJournalFeedback(readingJournalId, feedback);
    notifyListeners();
  }
}
