import 'dart:convert';

import 'package:http/http.dart';
import 'package:pra_uas/models/news.dart';

class ApiService {
  final endPointUrl = "https://jaroji.web.id/api/news.php";

  Future<List<News>> getNews() async {
    final response = await get(Uri.tryParse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['news'];

      List<News> news = body.map((item) => News.fromJson(item)).toList();

      return news;
    } else {
      throw Exception("Can't get the News!");
    }
  }
}