import 'dart:convert';
import 'package:news_app/models/articles.dart';
import 'package:http/http.dart' as http;

import '../models/articles.dart';

class API {
  static String APIKEY = "dc8c7c9f354041ec85e980754d51f881";

  static fetchNews() async {
    List<Articles> articles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$APIKEY");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body)['articles'];
    for (var i in responsebody) {
      articles.add(Articles(
          title: i['title'],
          description: i['description'],
          url: i['url'],
          urlToImage: i['urlToImage']));
    }
    return articles;
  }

  static fetchCategoriesNews(String category) async {
    List<Articles> articles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$APIKEY");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body)['articles'];
    for (var i in responsebody) {
      articles.add(Articles(
          title: i['title'],
          description: i['description'],
          url: i['url'],
          urlToImage: i['urlToImage']));
    }
    return articles;
  }
}
