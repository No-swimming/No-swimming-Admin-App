class JournalList {
  int? bookId;
  int? bookNum;
  String? title;
  bool? recordReject;
  String? readingJournalType;
  int? readingJournalId;

  JournalList(
      {this.bookId,
      this.bookNum,
      this.title,
      this.recordReject,
      this.readingJournalType,
      this.readingJournalId});

  JournalList.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookNum = json['book_num'];
    title = json['title'];
    recordReject = json['record_reject'];
    readingJournalType = json['reading_journal_type'];
    readingJournalId = json['reading_journal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_num'] = bookNum;
    data['title'] = title;
    data['record_reject'] = recordReject;
    data['reading_journal_type'] = readingJournalType;
    data['reading_journal_id'] = readingJournalId;
    return data;
  }
}
