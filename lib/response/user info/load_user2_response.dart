import 'package:json_annotation/json_annotation.dart';
part 'load_user2_response.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class LoadUser2Response {
  @JsonKey(name: '_id')
  String? id;
  String? fullname;
  String? username;
  String? email;
  String? profile_pic;
  

  LoadUser2Response({
    this.fullname,
    this.username,
    this.email,
    this.profile_pic,
  });
  factory LoadUser2Response.fromJson(Map<String, dynamic> json) {
    return _$LoadUser2ResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoadUser2ResponseToJson(this);
}