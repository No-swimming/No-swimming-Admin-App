import 'package:no_swimming_admin_app/Model/journal/journal.dart';

class JournalList {
  List<Journal>? journalList;

  JournalList({this.journalList});

  JournalList.fromJson(Map<String, dynamic> json) {
    if (json['journal_list'] != null) {
      journalList = <Journal>[];
      json['journal_list'].forEach((v) {
        journalList!.add(Journal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (journalList != null) {
      data['journal_list'] = journalList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
