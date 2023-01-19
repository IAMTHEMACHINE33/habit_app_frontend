// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      task_name: json['task_name'] as String?,
      penalty: json['penalty'] as String?,
      peer: json['peer'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'task_name': instance.task_name,
      'penalty': instance.penalty,
      'peer': instance.peer,
    };
