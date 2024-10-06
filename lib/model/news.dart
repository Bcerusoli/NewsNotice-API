import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str)["articles"].map((x) => News.fromJson(x)));

class News {
  String? sourceId;
  String? sourceName;
  String? author;
  String title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News({
    this.sourceId,
    this.sourceName,
    this.author,
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    sourceId: json["source"]["id"],
    sourceName: json["source"]["name"],
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],
    content: json["content"],
  );
}