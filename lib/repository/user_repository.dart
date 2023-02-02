import 'dart:io';

import 'package:flutter/material.dart';
import 'package:habit_app_front/api/user_api.dart';
import 'package:habit_app_front/models/dropdown_friend.dart';
import 'package:habit_app_front/response/friends%20info/load_friend_response.dart';
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
  Future<List<DropdownFriend?>> userFriend() async{
    return UserApi().userFriend();
  }
  Future<bool> uploadProfile(File? image) async{
    return UserApi().uploadProfile(image);
  }
  // Future<List<PeopleResponse?>> userShow() async{
  //   return UserApi().userShow();
  // }
}