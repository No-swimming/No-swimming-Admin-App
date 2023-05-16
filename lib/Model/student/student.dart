class Student {
  int? userId;
  int? grade;
  int? classNum;
  int? number;
  String? name;
  int? profileNum;

  Student(
      {this.userId,
      this.grade,
      this.classNum,
      this.number,
      this.name,
      this.profileNum});

  Student.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    grade = json['grade'];
    classNum = json['class_num'];
    number = json['number'];
    name = json['name'];
    profileNum = json['profile_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['grade'] = grade;
    data['class_num'] = classNum;
    data['number'] = number;
    data['name'] = name;
    data['profile_num'] = profileNum;
    return data;
  }
}
