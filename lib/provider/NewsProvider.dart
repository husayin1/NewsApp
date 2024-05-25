import 'package:flutter/material.dart';
import 'package:newapp/Models/Models.dart';
import 'package:newapp/Models/Service.dart';

class NewsProvider with ChangeNotifier {
  List<Articles> _news = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Articles> get news => _news;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNewsData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final fetchedNews = await NewsService.fetchNews();
      _news = fetchedNews.articles ?? [];
      _isLoading = false;
    } catch (error) {
      _errorMessage = 'Failed to load news: $error';
      _news = [];
    }
    notifyListeners();
  }

  void toggleFavorite(Articles newsItem) {
    newsItem.isSaved = !newsItem.isSaved;
    notifyListeners();
  }
}