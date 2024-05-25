
import 'package:flutter/material.dart';
import 'package:newapp/Views/SavedNewsCell.dart';
import 'package:newapp/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final savedNews = newsProvider.news.where((news) => news.isSaved).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Saved News',style: TextStyle(color: Colors.deepOrange),)),
      ),
      body: ListView.builder(
        itemCount: savedNews.length,
        itemBuilder: (context, index) {
          final newsItem = savedNews[index];
          return NewsListCell(news: newsItem);
        },
      ),
    );
  }
}