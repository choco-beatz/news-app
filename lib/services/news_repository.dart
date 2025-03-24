import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalpas_machine_test/constant/constants.dart';
import 'package:kalpas_machine_test/model/news_model.dart';

class NewsRepository {
  Future<NewsModel> getNews() async {
    final response =
        await http.get(Uri.parse("$baseUrl=bbc-news&apiKey=$apiKey"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewsModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<NewsModel> getNewsByTitle(String title) async {
    final response = await http.get(
      Uri.parse("$baseUrl${Uri.encodeComponent(title)}&apiKey=$apiKey"),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsModel.fromJson(body);
    }
    throw Exception('Error fetching news by title');
  }
}
