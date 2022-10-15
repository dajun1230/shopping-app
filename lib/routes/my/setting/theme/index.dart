import 'package:flutter/material.dart';
import 'package:shopping_app/common/data/app_options.dart';

const themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('主题'),
      ),
      body: ListView(
        //显示主题色块
        children: themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              /// 主题更新后，MaterialApp会重新build
              AppOptions.update(context, options.copyWith(theme: e));
            },
          );
        }).toList(),
      ),
    );
  }
}
