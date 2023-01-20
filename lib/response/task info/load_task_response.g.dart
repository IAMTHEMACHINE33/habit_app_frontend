// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadTaskResponse _$LoadTaskResponseFromJson(Map<String, dynamic> json) =>
    LoadTaskResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoadTask2Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoadTaskResponseToJson(LoadTaskResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
