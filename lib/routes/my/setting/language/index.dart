import 'package:flutter/material.dart';
import 'package:shopping_app/common/data/app_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    final options = AppOptions.of(context);
    final localizations = AppLocalizations.of(context)!;
    String currentLocale = options.locale.toString();

    Widget buildLanguageItem(String lan, String value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: currentLocale == value ? color : null),
        ),
        trailing:
            currentLocale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          AppOptions.update(context, options.copyWith(locale: Locale(value)));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.language),
      ),
      body: ListView(
        children: <Widget>[
          buildLanguageItem("中文简体", "zh"),
          buildLanguageItem("English", "en"),
        ],
      ),
    );
  }
}
