import 'package:json_annotation/json_annotation.dart';

part 'load_friend2_response.g.dart';

@JsonSerializable()
class LoadFriend2Response {
  @JsonKey(name:"_id")
  String? id;
  String? fullname;
  String? username;
  String? email;
  String? profile_pic;

  LoadFriend2Response({this.fullname,this.username,this.email,this.profile_pic});

  factory LoadFriend2Response.fromJson(Map<String, dynamic> json) =>
      _$LoadFriend2ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadFriend2ResponseToJson(this);

}