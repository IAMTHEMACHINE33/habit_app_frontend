import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

@JsonSerializable()
class Task{
  String? task_name;
  String? penalty;
  String? peer;
  Task({this.task_name,this.penalty,this.peer});

  factory Task.fromJson(Map<String, dynamic> json)=>_$TaskFromJson(json);

  Map<String, dynamic> toJson()=>_$TaskToJson(this);
}