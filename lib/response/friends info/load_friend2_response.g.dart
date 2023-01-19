// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_friend2_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadFriend2Response _$LoadFriend2ResponseFromJson(Map<String, dynamic> json) =>
    LoadFriend2Response(
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      profile_pic: json['profile_pic'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$LoadFriend2ResponseToJson(
        LoadFriend2Response instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'profile_pic': instance.profile_pic,
    };
