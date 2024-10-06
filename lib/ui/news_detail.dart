import 'package:flutter/material.dart';
import 'package:widgetflutter/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            news.urlToImage != null
                ? Image.network(news.urlToImage!)
                : Container(),
            const SizedBox(height: 8),
            Text(
              news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(news.description ?? 'No description available'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final url = news.url;
                if (url != null && url.isNotEmpty) {
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid URL')),
                  );
                }
              },
              child: const Text('Read more'),
            ),
          ],
        ),
      ),
    );
  }
}