class DetailJournal {
  int? bookId;
  int? bookNum;
  String? title;
  String? content;
  bool? recordReject;
  bool? isRejected;
  String? teacherName;
  String? teacherSubject;

  DetailJournal(
      {this.bookId,
      this.bookNum,
      this.title,
      this.content,
      this.recordReject,
      this.isRejected,
      this.teacherName,
      this.teacherSubject});

  DetailJournal.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookNum = json['book_num'];
    title = json['title'];
    content = json['content'];
    recordReject = json['record_reject'];
    isRejected = json['is_rejected'];
    teacherName = json['teacher_name'];
    teacherSubject = json['teacher_subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_num'] = bookNum;
    data['title'] = title;
    data['content'] = content;
    data['record_reject'] = recordReject;
    data['is_rejected'] = isRejected;
    data['teacher_name'] = teacherName;
    data['teacher_subject'] = teacherSubject;
    return data;
  }
}
