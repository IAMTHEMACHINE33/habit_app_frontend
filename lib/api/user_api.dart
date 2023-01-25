import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:habit_app_front/response/friends%20info/load_friend_response.dart';
import 'package:habit_app_front/validators.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import '../models/dropdown_friend.dart';
import '../models/user.dart';
import '../response/login_response.dart';
import '../response/user info/load_user_response.dart';
import '../utils/url.dart';
import 'http_services.dart';

class UserApi {
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
        userId = loginResponse.userId;
        if (loginResponse.success == true) {
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
        // print('first');
        // print(response.data);
        // print(response.data);
        loaduserResponse = LoadUserResponse.fromJson(response.data);
        // print(loaduserResponse.data!.fullname);
        // print('last');
      } else {
        loaduserResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    // debugPrint(userResponse.toString());
    return loaduserResponse;
  }

  Future<List<DropdownFriend?>> userFriend() async {
    Future.delayed(Duration(seconds: 2), () {});
    LoadFriendResponse? loadfriendresponse;
    List<DropdownFriend?> friendList = [];

    const url = baseUrl + getFriendUrl;
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
        // print('first');
        // print(response.data);
        // print(response.data);
        loadfriendresponse = LoadFriendResponse.fromJson(response.data);

        for (var data in loadfriendresponse.data!) {
          // debugPrint(data.fullname);
          friendList.add(DropdownFriend(
              id: data.id,
              username: data.username,
              email: data.email,
              fullname: data.fullname));
        }
        // print(friendList);
        // print(loadfriendresponse.success);
        // print('last');
      } else {
        friendList = [];
      }
    } catch (e) {
      throw Exception(e);
    }
    return friendList;
  }

  Future<bool> uploadProfile(File? image) async {
    Future.delayed(Duration(seconds: 2), () {});
    bool isuploaded = false;
    const url = baseUrl + uplaodProfilePicUrl;
    String fileName = image!.path.split("/").last;
    FormData formData = new FormData.fromMap({
      "profile_pic": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType("image", "jpg"),
      ),"type":"image/jpg"
    });
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            "Content-Type":"multipat/form-data"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("Upload Sucess!");
        isuploaded = true;
        return isuploaded;
      } else {
        print("Upload failed");
        return isuploaded;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
