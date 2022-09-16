import 'package:flutter/material.dart';
import 'package:shopping_app/common/my_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  bool _checkboxSelected = true;

  void handleLogin() {
    // var userinfo = {
    //   username: _usernameController.text,
    //   password: _pwdController.text
    // };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, bottom: 0, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 150,
                  child: Center(
                    child: Image.asset('assets/images/strawberry.png'),
                  ),
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            fillColor: const Color(
                                0xFFEEEEEE), // 背景颜色，必须结合filled: true,才有效
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            hintText: "用户名/邮箱/手机号",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none)),
                        validator: (v) {
                          return v!.trim().isEmpty ? null : "用户名不能为空";
                        },
                      ),
                      Container(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFEEEEEE),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          hintText: "请输入密码",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                        obscureText: true,
                        validator: (v) {
                          return v!.trim().length > 5 ? null : "密码不能少于6位";
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              // side: const BorderSide(color: Color(0xFF1089ff)),
                              shape: const CircleBorder(
                                  side: BorderSide(color: Color(0xFF808080))),
                              value: _checkboxSelected,
                              activeColor: const Color(0xFF1089ff),
                              onChanged: (value) {
                                setState(() {
                                  _checkboxSelected = value!;
                                });
                              },
                            ),
                            const Text.rich(TextSpan(children: [
                              TextSpan(text: "我已经阅读并同意"),
                              TextSpan(
                                  text: "《某某隐私政策》",
                                  style: TextStyle(color: Color(0xFF7D92FE)))
                            ]))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          style: ButtonStyle(
                            // backgroundColor: MaterialStateProperty.all(
                            //     Color(0xffFFF8E5)), //背景颜色
                            // foregroundColor: MaterialStateProperty.all(
                            //     Color(0xffB85F23)), //字体颜色
                            // overlayColor: MaterialStateProperty.all(
                            //     Color(0xffFFF8E5)), // 高亮色
                            // shadowColor: MaterialStateProperty.all(
                            //     Color(0xffffffff)), //阴影颜色
                            // elevation: MaterialStateProperty.all(0), //阴影值
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 20)), //字体
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(top: 12, bottom: 12)),
                            side:
                                MaterialStateProperty.all(BorderSide.none), //边框
                            shape:
                                MaterialStateProperty.all(const StadiumBorder(
                                    side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffFF7F24),
                            ))),
                          ),
                          child: const Text('登 录'),
                        ),
                      ),
                      Container(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: const Text(
                              "新用户注册",
                              style: TextStyle(
                                  color: Color(0xFF808080), fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: const Text("短信验证码登陆",
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 16)),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: const Text("忘记密码",
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 16)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: Color(0xFFDEDEDE)),
                            ),
                          ),
                          Text(
                            '其他登陆方式',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 80,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: Color(0xFFDEDEDE)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24.0)),
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: const Icon(MyIcons.apple),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F7E6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: const Icon(
                            MyIcons.chat,
                            color: Color(0xFF54B835),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9E7E7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: const Icon(
                            MyIcons.phone,
                            color: Color(0xFFCA2C1F),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F6FD),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: const Icon(
                            MyIcons.qq,
                            color: Color(0xFF53B6F6),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9E9E9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: const Icon(
                            MyIcons.ren,
                            color: Color(0xFFE43C27),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
