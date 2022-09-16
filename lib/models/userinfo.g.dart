// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) => Userinfo(
      id: json['id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      status: json['status'] as int?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      sex: json['sex'] as int?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'status': instance.status,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'sex': instance.sex,
      'avatar': instance.avatar,
    };
