import 'package:flutter/material.dart';
import 'package:habit_app_front/api/user_api.dart';

import '../models/user.dart';

class UserRepository{
  Future<bool> register(User user) async{
    return await UserApi().register(user);
  }
}