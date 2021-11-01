import 'dart:convert';

import 'package:fluter_roject/users/models/user.dart';
import 'package:fluter_roject/users/services/spring_link.dart';
import 'package:http/http.dart' as http;

class UsersDatabaseService {
  static Future<Users> addUsers(String userName,  String firstName,String lastName,String password ) async {
    Map data = {
        "userName":userName,
        "firstName":firstName,
        "lastName":lastName,
        "password":password ,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/save-users');
    http.Response response = await http.post( url, headers: headers, body: body);
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Users users = Users.fromMap(responseMap);
    return users;
  }

  static Future<List<Users>> getUsers() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Users> users = [];
    for (Map userMap in responseList) {
      Users user = Users.fromMap(userMap);
      users.add(user);
    }
    return users;
  }

  // static Future<http.Response> updateUsers(int id) async {
  //   var url = Uri.parse(baseURL + '/update/$id');
  //   http.Response response = await http.put(
  //     url,
  //     headers: headers,
  //   );
  //   print(response.body);
  //   return response;
  // }

  static Future<http.Response> deleteUser(int id) async {
    var url = Uri.parse(baseURL + '/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}