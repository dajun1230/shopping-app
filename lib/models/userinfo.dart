import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
  String? id;
  String? username;
  String? password;
  int? status;
  String? email;
  String? phoneNumber;
  int? sex;
  String? avatar;

  Userinfo(
      {this.id,
      this.username,
      this.password,
      this.status,
      this.email,
      this.phoneNumber,
      this.sex,
      this.avatar});

  factory Userinfo.fromJson(Map<String, dynamic> json) =>
      _$UserinfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
