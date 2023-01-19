import 'package:habit_app_front/api/task_api.dart';

import '../models/task.dart';

class TaskRepository{
  Future<bool> addTask(String task_name, String penalty, String? peer)async{
    return await TaskApi().addTask(task_name, penalty, peer);
  }
}