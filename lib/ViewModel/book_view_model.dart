import 'package:no_swimming_admin_app/Model/book/book.dart';
import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Repository/book_repository.dart';

class BookViewModel with ChangeNotifier {
  late final BookRepository _repository;

  final List<Book> _bookList = List.empty(growable: true);

  List<Book> get bookList => _bookList;

  BookViewModel() {
    _repository = BookRepository();
  }

  Future<void> getStudentChoiceBook(String bookName) async {
    _bookList.add(await _repository.getStudentChoiceBook(bookName));
    notifyListeners();
  }
}
