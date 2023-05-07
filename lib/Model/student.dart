class Student {
  int? grade;
  int? classNum;
  int? number;
  String? name;

  Student({this.grade, this.classNum, this.number, this.name});

  Student.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    classNum = json['class_num'];
    number = json['number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grade'] = grade;
    data['class_num'] = classNum;
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}
