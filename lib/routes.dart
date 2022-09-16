import 'package:flutter/material.dart';
import 'package:shopping_app/routes/login/register.dart';
import 'package:shopping_app/routes/my_home_page.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const MyHomePage(),
  '/register': (BuildContext context) {
    return const RegisterPage();
  }
};
