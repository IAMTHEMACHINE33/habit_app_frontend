import 'dart:io';

import 'package:dio/dio.dart';
import 'package:habit_app_front/api/http_services.dart';
import 'package:habit_app_front/utils/url.dart';

import '../models/task.dart';
import '../response/Task add/load_task_id.dart';
import '../response/task info/load_task_response.dart';

class TaskApi {
  Future<bool> addTask(String task_name, String penalty, String? peer) async {
    bool isAdded = false;
    Response response;
    Response response2;
    LoadTaskId? loadTaskId;
    var task_id;
    var url = baseUrl + addTaskUrl;
    var url2 = baseUrl + addTaskPeerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      print("on");
      response = await dio.post(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
        data: {"task_name": task_name, "penalty": penalty},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        isAdded = true;
        loadTaskId = LoadTaskId.fromJson(response.data);
        task_id = loadTaskId.data;
      }
      response2 = await dio.post(url2,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ),
          data: {
            "task": task_id,
            "peer": peer,
          });
      if (response2.statusCode == 200) {
        return isAdded;
      }
    } catch (e) {
      throw Exception(e);
    }
    return isAdded;
  }

  Future<LoadTaskResponse?> userTask() async {
    LoadTaskResponse? loadtaskresponse;
    Response response;
    var url = baseUrl + getUserTaskUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader:"Bearer $token"
          }
        ),
      );
      if(response.statusCode == 200){
        loadtaskresponse = LoadTaskResponse.fromJson(response.data);
        print(loadtaskresponse.data![0].task_name);
      }else{
        loadtaskresponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return loadtaskresponse;
  }
}
