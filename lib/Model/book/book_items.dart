class BookItems {
  String? title;
  String? link;
  String? image;
  String? author;
  String? discount;
  String? publisher;
  String? pubDate;
  String? isbn;
  String? description;

  BookItems(
      {this.title,
      this.link,
      this.image,
      this.author,
      this.discount,
      this.publisher,
      this.pubDate,
      this.isbn,
      this.description});

  BookItems.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    image = json['image'];
    author = json['author'];
    discount = json['discount'];
    publisher = json['publisher'];
    pubDate = json['pubdate'];
    isbn = json['isbn'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['image'] = image;
    data['author'] = author;
    data['discount'] = discount;
    data['publisher'] = publisher;
    data['pubdate'] = pubDate;
    data['isbn'] = isbn;
    data['description'] = description;
    return data;
  }
}
