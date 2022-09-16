import 'package:flutter/material.dart';
import 'package:shopping_app/routes/cart/index.dart';
import 'package:shopping_app/routes/classify/index.dart';
import 'package:shopping_app/routes/home/index.dart';
import 'package:shopping_app/routes/my/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _list = [
    const HomePage(),
    const ClassifyPage(),
    const CartPage(),
    const MyPage()
  ];

  int _currentIndex = 0;

  void onTapChange(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapChange,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.orange.shade700,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "分类"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "购物车"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "我的"),
          ]),
    );
  }
}
