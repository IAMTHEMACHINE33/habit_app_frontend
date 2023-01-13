import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class User_response {
  String? fullname;
  String? username;
  String? password;
  String? email;
  

  User_response({
    this.fullname,
    this.username,
    this.password,
    this.email,
  });

    factory User_response.fromJson(Map<String, dynamic> json) =>
      _$User_responseFromJson(json);

  Map<String, dynamic> toJson() => _$User_responseToJson(this);

}