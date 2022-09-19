import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    Locale locale = Localizations.localeOf(context);
    print(locale); // 'zh_CN'

    // var gm = GmLocalizations.of(context);

    Widget buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: 'zh_CN' == value ? color : null),
        ),
        trailing: 'zh_CN' == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          // localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("语言"),
      ),
      body: ListView(
        children: <Widget>[
          buildLanguageItem("中文简体", "zh_CN"),
          buildLanguageItem("English", "en_US"),
          // _buildLanguageItem(gm.auto, null),
        ],
      ),
    );
  }
}
