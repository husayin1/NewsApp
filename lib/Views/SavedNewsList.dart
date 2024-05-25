
import 'package:flutter/material.dart';
import 'package:newapp/Views/SavedNewsCell.dart';
import 'package:newapp/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provider.errorMessage != null) {
          return Center(child: Text(provider.errorMessage!));
        }
        if (provider.news.isEmpty) {
          return const Center(child: Text('No News Available!.'));
        }
        return ListView.builder(
          itemCount: provider.news.length,
          itemBuilder: (context, index) {
            final newsItem = provider.news[index];
            return NewsListCell(news: newsItem);
          },
        );
      },
    );
  }
}