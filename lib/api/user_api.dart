import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../response/login_response.dart';
import '../response/user info/load_user_response.dart';
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
   Future<bool> login(String username, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();  
      var response = await dio.post(
        url,
        data: {
          "username": username,
          "password": password,
        },
      );
      
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;  
        if(loginResponse.success == true){
          isLogin = true;
        }
        
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
  Future<LoadUserResponse?> userInfo() async {
    Future.delayed(const Duration(seconds: 2), () {});
    LoadUserResponse? loaduserResponse;
    const url = baseUrl + getUserUrl;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ));

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString());
        print('first');
        // print(response.data);
        // print(response.data);
        loaduserResponse = LoadUserResponse.fromJson(response.data);
        print(loaduserResponse.data!.fullname);
        print('last');
      } else {
        loaduserResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    // debugPrint(userResponse.toString());
    return loaduserResponse;
  }
}