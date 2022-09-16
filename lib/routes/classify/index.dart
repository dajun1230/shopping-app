import 'package:flutter/material.dart';

class ClassifyPage extends StatefulWidget {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  State<ClassifyPage> createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("分类"),
      ),
      body: const Center(child: Text('分类')),
    );
  }
}
