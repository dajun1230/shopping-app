import 'package:flutter/material.dart';
import 'package:shopping_app/routes/cart/video/video_screen.dart';
import 'package:shopping_app/routes/login/index.dart';
import 'package:shopping_app/routes/login/register.dart';
import 'package:shopping_app/routes/my/setting/language/index.dart';
import 'package:shopping_app/routes/my/setting/theme/index.dart';
import 'package:shopping_app/routes/my_home_page.dart';

var routes = <String, WidgetBuilder>{
  '/': (BuildContext context) {
    return const MyHomePage();
  },

  /// 登录、注册
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),

  /// 设置
  '/setting/language': (context) => const LanguagePage(),
  '/setting/theme': (context) => const ThemeSettingPage(),

  /// 视频
  '/cart/video': (context) => const VideoScreen(),
};
