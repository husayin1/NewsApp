import 'package:newapp/Models/Models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  static const String apiKey = '42def77111ea4427b181cd18ff4b4957';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';

  static Future<NewsResponse> fetchNews() async {
    final url = Uri.parse('$baseUrl?apiKey=$apiKey&country=us');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newsResponse = NewsResponse.fromJson(data);
        return newsResponse;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      rethrow;
    }
  }
}