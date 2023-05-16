import 'package:no_swimming_admin_app/DataSource/RemoteDataSource/student_list_data_source.dart';
import 'package:no_swimming_admin_app/Model/student/student.dart';

class StudentListRepository {
  final StudentListDataSource _dataSource = StudentListDataSource();

  Future<List<Student>> readStudentList({int? grade, int? classNum}) async =>
      _dataSource.readStudentList(grade: grade, classNum: classNum);
}
