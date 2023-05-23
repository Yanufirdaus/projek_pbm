import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projek_pbm/model.dart';

class Repository{
  final _baseURL = 'https://646ce8a07b42c06c3b2c4013.mockapi.io/nyobalagi';

  Future getData() async{
    try{
      final response = await http.get(Uri.parse(_baseURL));

      if (response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        
        return album;
      }
    } catch(e){
      print(e.toString());
    }
  }
}