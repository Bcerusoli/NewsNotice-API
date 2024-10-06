import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:widgetflutter/model/news.dart';

class NewsService {
  final String apiKey = 'fcb7aefb73d94c33942d1bf93d801361';
  final String apiUrl = 'https://newsapi.org/v2/everything?q=tesla&from=2024-09-06&sortBy=publishedAt&apiKey=';

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(apiUrl + apiKey));

    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}