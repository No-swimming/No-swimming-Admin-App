import 'dart:convert';

import 'package:no_swimming_admin_app/Model/book/book.dart';
import 'package:http/http.dart' as http;
import 'package:no_swimming_admin_app/baseurl.dart';

class BookDataSource {
  Future<Book> getStudentChoiceBook(String bookName) async {
    final response = await http.get(
        Uri.parse(
            "$naverOpenAPIUrl/v1/search/book_adv.json?display=1&d_titl=$bookName"),
        headers: {
          "X-Naver-Client-Id": clientId,
          "X-Naver-Client-Secret": clientSecret
        });
    if (response.statusCode == 200) {
      return Book.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Exception(response.body);
  }
}
