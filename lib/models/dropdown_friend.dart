// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'dropdown_friend.g.dart';

@JsonSerializable()
class DropdownFriend {
    @JsonKey(name: '_id')
    String? id;
    String? username;
    String? email;
    String? fullname;
    

  DropdownFriend({
    this.id,
    this.username,
    this.email,
    this.fullname
  });

  factory DropdownFriend.fromJson(Map<String, dynamic> json) =>
      _$DropdownFriendFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownFriendToJson(this);
}

