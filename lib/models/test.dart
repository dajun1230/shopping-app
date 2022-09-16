import 'dart:convert';

import 'package:shopping_app/models/api_response.dart';
import 'package:shopping_app/models/userinfo.dart';

void main() {
  testJsonOne();
}

testJsonOne() {
  String str =
      '{"code": 200,"message": "请求成功","data": [{"id": "123","username": "小杨","password": "123456","status": 1,"email": "8723423@qq.com","phoneNumber": "18982052323","int": 0,"avatar": ""}]}';
  Map<String, dynamic> json = jsonDecode(str);
  ApiResponse<List<Userinfo>> result = ApiResponse.fromJson(
      json,
      (json) => (json as List<dynamic>)
          .map(
            (e) => Userinfo.fromJson(e),
          )
          .toList());

  List<Userinfo> list = result.data;
  Userinfo userinfo = list[0];
  print("sdf");
  print(userinfo.toJson());
}
