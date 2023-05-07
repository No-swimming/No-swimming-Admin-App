import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/student_list_data_source.dart';
import 'package:no_swimming_admin_app/Model/student.dart';

class StudentListRepository {
  final StudentListDataSource _dataSource = StudentListDataSource();

  Future<List<Student>> readStudentList() async =>
      _dataSource.readStudentList();
}
