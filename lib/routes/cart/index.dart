import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("购物车"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("进入视频页面"),
          onPressed: () {
            Navigator.pushNamed(context, '/cart/video');
          },
        ),
      ),
    );
  }
}
