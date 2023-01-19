import 'package:json_annotation/json_annotation.dart';

import 'load_user2_response.dart';


part 'load_user_response.g.dart';

@JsonSerializable()
class LoadUserResponse {
  bool? success;
  LoadUser2Response? data;

  LoadUserResponse({this.success, this.data});

  factory LoadUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadUserResponseToJson(this);
}
