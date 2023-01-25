import 'dart:io';

import 'package:dio/dio.dart';
import 'package:habit_app_front/api/http_services.dart';
import 'package:habit_app_front/utils/url.dart';
import 'package:http_parser/http_parser.dart';

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
            headers: {HttpHeaders.authorizationHeader: "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        loadtaskresponse = LoadTaskResponse.fromJson(response.data);
        print(loadtaskresponse.data![0].task_name);
      } else {
        loadtaskresponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return loadtaskresponse;
  }

  Future<bool> uploadTaskProof(File? image) async {
    Future.delayed(Duration(seconds: 2), () {});
    bool isUploaded = false;
    const url = baseUrl + uploadTaskProofUrl;
    String fileName = image!.path.split("/").last;
    FormData formData = new FormData.fromMap({
      "profile_pic": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType("image", "jpg"),
      ),
      "type": "image/jpg"
    });
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            "Content-Type": "multipat/form-data"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("Upload Success!");
        isUploaded = true;
        return isUploaded;
      } else {
        print("Upload failed!");
        return isUploaded;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
