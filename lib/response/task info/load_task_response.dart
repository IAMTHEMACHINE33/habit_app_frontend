import 'package:json_annotation/json_annotation.dart';
import 'load_task2_response.dart';
part 'load_task_response.g.dart';
@JsonSerializable()
class LoadTaskResponse{
  bool? success;
  List<LoadTask2Response>? data;

  LoadTaskResponse({this.success,this.data});

  factory LoadTaskResponse.fromJson(Map<String, dynamic> json)=>_$LoadTaskResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTaskResponseToJson(this);
}