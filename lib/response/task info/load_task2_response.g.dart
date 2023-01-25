// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_task2_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadTask2Response _$LoadTask2ResponseFromJson(Map<String, dynamic> json) =>
    LoadTask2Response(
      task_name: json['task_name'] as String?,
      penalty: json['penalty'] as String?,
      include_users: (json['include_users'] as List<dynamic>?)
          ?.map(
              (e) => LoadTask21UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      proof: (json['proof'] as List<dynamic>?)
          ?.map((e) =>
              LoadTask22ProofResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      streak: json['streak'] as String?,
    );

Map<String, dynamic> _$LoadTask2ResponseToJson(LoadTask2Response instance) =>
    <String, dynamic>{
      'task_name': instance.task_name,
      'penalty': instance.penalty,
      'streak': instance.streak,
      'include_users': instance.include_users,
      'proof': instance.proof,
    };
