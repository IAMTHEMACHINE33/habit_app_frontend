// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user2_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUser2Response _$LoadUser2ResponseFromJson(Map<String, dynamic> json) =>
    LoadUser2Response(
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      profile_pic: json['profile_pic'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$LoadUser2ResponseToJson(LoadUser2Response instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'profile_pic': instance.profile_pic,
    };
