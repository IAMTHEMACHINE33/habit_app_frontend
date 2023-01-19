import 'package:flutter/material.dart';
import 'package:habit_app_front/api/user_api.dart';

import '../models/user.dart';
import '../response/user info/load_user_response.dart';

class UserRepository{
  Future<bool> register(User user) async{
    return await UserApi().register(user);
  }
  Future<bool> login(String username, String password) async{
    return UserApi().login(username, password);
  }
  Future<LoadUserResponse?> userInfo() async{
    return UserApi().userInfo();
  } 
}