import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:json_annotation/json_annotation.dart';
import 'load_task21_user.dart';
import 'load_task22_proof.dart';

part 'load_task2_response.g.dart';

@JsonSerializable()
class LoadTask2Response{
  String? task_name;
  String? penalty;
  List<LoadTask21UserResponse>? include_users;
  List<LoadTask22ProofResponse>? proof;

  LoadTask2Response({this.task_name,this.penalty,this.include_users,this.proof});

  factory LoadTask2Response.fromJson(Map<String, dynamic> json)=>_$LoadTask2ResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTask2ResponseToJson(this);
}