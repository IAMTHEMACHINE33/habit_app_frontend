// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_response _$User_responseFromJson(Map<String, dynamic> json) =>
    User_response(
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$User_responseToJson(User_response instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
    };
