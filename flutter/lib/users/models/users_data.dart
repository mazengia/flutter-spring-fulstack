
import 'package:fluter_roject/users/models/user.dart';
import 'package:fluter_roject/users/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  List<Users> user = [];
  void addUsers(String userName, String firstName, String lastName, String password ) async {
    Users users = await UsersDatabaseService.addUsers(userName, firstName,  lastName, password );
    user.add(users);
    notifyListeners();
  }
}