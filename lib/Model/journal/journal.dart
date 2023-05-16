import 'package:no_swimming_admin_app/Model/journal/journal_list.dart';

class Journal {
  List<JournalList>? journalList;

  Journal({this.journalList});

  Journal.fromJson(Map<String, dynamic> json) {
    if (json['journal_list'] != null) {
      journalList = <JournalList>[];
      json['journal_list'].forEach((v) {
        journalList!.add(JournalList.fromJson(v));
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
