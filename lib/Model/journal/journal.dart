class Journal {
  int? bookId;
  int? bookNum;
  String? title;
  bool? recordReject;
  String? readingJournalType;
  int? readingJournalId;
  int? userId;
  String? createdAt;

  Journal(
      {this.bookId,
      this.bookNum,
      this.title,
      this.recordReject,
      this.readingJournalType,
      this.readingJournalId,
      this.userId,
      this.createdAt});

  Journal.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookNum = json['book_num'];
    title = json['title'];
    recordReject = json['record_reject'];
    readingJournalType = json['reading_journal_type'];
    readingJournalId = json['reading_journal_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_num'] = bookNum;
    data['title'] = title;
    data['record_reject'] = recordReject;
    data['reading_journal_type'] = readingJournalType;
    data['reading_journal_id'] = readingJournalId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    return data;
  }
}
