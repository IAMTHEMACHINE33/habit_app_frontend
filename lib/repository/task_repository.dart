import 'dart:io';

import 'package:habit_app_front/api/task_api.dart';
import 'package:habit_app_front/response/task%20info/load_task_response.dart';

import '../models/task.dart';

class TaskRepository{
  Future<bool> addTask(String task_name, String penalty, String? peer)async{
    return await TaskApi().addTask(task_name, penalty, peer);
  }
  Future<LoadTaskResponse?> userTask() async{
    return TaskApi().userTask();
  }
  Future<bool> uploadTaskProof(File? image) async{
    return TaskApi().uploadTaskProof(image);
  }
}