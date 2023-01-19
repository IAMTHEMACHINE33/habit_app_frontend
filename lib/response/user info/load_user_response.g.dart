// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUserResponse _$LoadUserResponseFromJson(Map<String, dynamic> json) =>
    LoadUserResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : LoadUser2Response.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoadUserResponseToJson(LoadUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
