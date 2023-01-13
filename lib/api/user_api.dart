import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/url.dart';
import 'http_services.dart';

class UserApi{
  Future<bool> register(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        isSignup = true;
        return isSignup;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }
}