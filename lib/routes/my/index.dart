import 'package:flutter/material.dart';
import 'package:shopping_app/models/api_response.dart';
import 'package:shopping_app/models/userinfo.dart';
import 'package:shopping_app/utils/dio_util/dio_request.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Userinfo _userinfo = Userinfo();

  void getUserinfo() async {
    print("获取用户信息开始：");
    Map<String, dynamic> params = {"id": "123"};
    Map<String, dynamic> response =
        await dioRequest.get<Userinfo>("/user/query", queryParameters: params);
    ApiResponse<Userinfo> data =
        ApiResponse.fromJson(response, (json) => Userinfo.fromJson(json));
    print("sdf");
    print("最后的结果：");
    setState(() {
      _userinfo = data.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('我的')),
        body: Column(
          children: [
            ElevatedButton(onPressed: getUserinfo, child: const Text('获取用户信息')),
            Text('用户名：${_userinfo.username ?? ""}'),
          ],
        ));
  }
}
