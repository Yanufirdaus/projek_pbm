import 'dart:convert';
import 'package:http/http.dart';

import '../page/model/article_model.dart';

class ApiServices{
  final endPointUrl = "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=02faf012a7014e95931e0bd44b205846";


  Future <List<Article>> getArticle() async{
    Response res = await get(Uri.parse(endPointUrl));

    if(res.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      List<Article> articles = 
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }
    else{
      throw("Tidak dapat terhubung");
    }
  }
}