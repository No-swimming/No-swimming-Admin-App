import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/book_data_source.dart';
import 'package:no_swimming_admin_app/Model/book/book.dart';

class BookRepository {
  final BookDataSource _dataSource = BookDataSource();

  Future<Book> getStudentChoiceBook(String bookName) async =>
      await _dataSource.getStudentChoiceBook(bookName);
}
