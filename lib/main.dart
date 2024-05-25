import 'package:flutter/material.dart';
import 'package:newapp/Views/SavedNews.dart';
import 'package:newapp/Views/SavedNewsList.dart';
import 'package:newapp/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider()..fetchNewsData(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer<NewsProvider>(
          builder: (context, newsProvider, _) => Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('News',style: TextStyle(color: Colors.deepOrange),)),
              actions: [
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SavedNewsPage()),
                    );
                  },
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () => newsProvider.fetchNewsData(),
              child: const NewsList(),
            ),
          ),
        ),
      ),
    );
  }
}



