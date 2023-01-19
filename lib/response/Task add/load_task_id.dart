import 'package:json_annotation/json_annotation.dart';
part 'load_task_id.g.dart';

@JsonSerializable()
class LoadTaskId {
  bool? success;
  String? data;

  LoadTaskId({this.success,this.data});

  factory LoadTaskId.fromJson(Map<String, dynamic> json)=>_$LoadTaskIdFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTaskIdToJson(this);
} 