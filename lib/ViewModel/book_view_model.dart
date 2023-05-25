import 'dart:convert';
import 'package:no_swimming_admin_app/Model/book/book.dart';
import 'package:flutter/material.dart';
import 'package:no_swimming_admin_app/Repository/book_repository.dart';

class BookViewModel with ChangeNotifier {
  late final BookRepository _repository;

  late Book _book;

  Book get book => _book;

  BookViewModel() {
    _repository = BookRepository();
    _book = Book();
  }

  Future<void> getStudentChoiceBook(String bookName) async {
    bookName = utf8.decode(bookName.codeUnits);
    _repository.getStudentChoiceBook(bookName);
    notifyListeners();
  }
}
