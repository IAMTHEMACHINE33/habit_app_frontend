import 'package:json_annotation/json_annotation.dart';

import 'load_friend2_response.dart';

part 'load_friend_response.g.dart';

@JsonSerializable()
class LoadFriendResponse{
  bool? success;
  List<LoadFriend2Response>? data;

  LoadFriendResponse({this.success,this.data});

factory LoadFriendResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadFriendResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadFriendResponseToJson(this);


}