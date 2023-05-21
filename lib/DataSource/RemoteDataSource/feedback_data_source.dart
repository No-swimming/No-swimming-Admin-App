import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';

class FeedbackDataSource {
  Future<void> sendJournalFeedback(
      int readingJournalId, String feedback) async {
    final response = await http.post(
        Uri.parse("$baseurl/feedback/$readingJournalId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $testToken"
        },
        body: jsonEncode({"content": feedback}));
    if (response.statusCode >= 400) {
      print(response.statusCode);
      throw Exception(response.body);
    }
  }
}
