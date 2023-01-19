// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_friend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadFriendResponse _$LoadFriendResponseFromJson(Map<String, dynamic> json) =>
    LoadFriendResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoadFriend2Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoadFriendResponseToJson(LoadFriendResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
