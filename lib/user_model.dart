import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class User{
  String id;
  String name;
  String avatar;

  User({required this.id, required this.name, required this.avatar});

  factory User.createUser(Map<String, dynamic> object)
  {
    return User(
      avatar:  object['avatar'],
      name: object['first_name'],
      id: object['id'],
    );
  }

  static Future<User> connectToAPI(Int id) async{
    String apiURL = "https://reqres.in/api/users" + id.toString();

    var apiResult = await http.get(apiURL as Uri);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }

}