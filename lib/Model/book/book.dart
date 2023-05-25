import 'package:no_swimming_admin_app/Model/book/book_items.dart';

class Book {
  String? lastBuildDate;
  int? total;
  int? start;
  int? display;
  List<BookItems>? items;

  Book({this.lastBuildDate, this.total, this.start, this.display, this.items});

  Book.fromJson(Map<String, dynamic> json) {
    lastBuildDate = json['lastBuildDate'];
    total = json['total'];
    start = json['start'];
    display = json['display'];
    if (json['items'] != null) {
      items = <BookItems>[];
      json['items'].forEach((v) {
        items!.add(BookItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastBuildDate'] = lastBuildDate;
    data['total'] = total;
    data['start'] = start;
    data['display'] = display;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
