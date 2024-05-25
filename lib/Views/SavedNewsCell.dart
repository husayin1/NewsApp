import 'package:flutter/material.dart';
import 'package:newapp/Models/Models.dart';
import 'package:newapp/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsListCell extends StatelessWidget {
  final Articles news;

  const NewsListCell({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          news.urlToImage ?? '', // Use urlToImage property
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.sms_failed_rounded,color: Colors.red,),
        ),
      ),
      title: Text(news.title ?? ''), // Use title property
      trailing: Consumer<NewsProvider>(
        builder: (context, newsProvider, _) => IconButton(
          icon: Icon(news.isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,color: Colors.deepOrange),
          onPressed: () {
            newsProvider.toggleFavorite(news);
          },
        ),
      ),
      onTap: () {
        // Navigate to news details page (implementation left to you)
      },
    );
  }
}


