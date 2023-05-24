import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/Model/journal/journal_list.dart';
import 'package:no_swimming_admin_app/Model/journal/journal.dart';
import 'package:no_swimming_admin_app/baseurl.dart';
import 'package:no_swimming_admin_app/Model/journal/detail_journal.dart';

class JournalDataSource {
  Future<JournalList> _searchJournalList(int userId) async {
    final response = await http
        .get(Uri.parse("$baseurl/teacher/student/journal?userId=$userId"));
    if (response.statusCode == 200) {
      return JournalList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("학생 리스트 불러 오기 실패");
    }
  }

  Future<List<Journal>> searchJournalList(int userId) async =>
      await _searchJournalList(userId).then((value) => value.journalList!);

  Future<void> closeUpJournal(int readingJournalId) async {
    final response =
        await http.patch(Uri.parse("$baseurl/journal/end/$readingJournalId"));
    if (response.statusCode == 404) {
      throw Exception(response.body);
    }
  }

  Future<void> closeUpAllJournalList(List<int> list) async {
    final response = await http.put(Uri.parse("$baseurl/journal/all"),
        body: jsonEncode({"reading_journal_id_list": list}));
    if (response.statusCode == 404) {
      throw Exception(response.body);
    }
  }

  Future<DetailJournal> getStudentDetailJournal(int readingJournalId) async {
    final response =
        await http.get(Uri.parse("$baseurl/journal/$readingJournalId"));
    if (response.statusCode == 200) {
      return DetailJournal.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Exception(response.body);
  }
}
