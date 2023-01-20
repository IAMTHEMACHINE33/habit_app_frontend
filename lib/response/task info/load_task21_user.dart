import 'package:json_annotation/json_annotation.dart';
part 'load_task21_user.g.dart';

@JsonSerializable()
class LoadTask21UserResponse{
  String? account;

  LoadTask21UserResponse({this.account});

  factory LoadTask21UserResponse.fromJson(Map<String, dynamic> json)=>_$LoadTask21UserResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTask21UserResponseToJson(this);
}