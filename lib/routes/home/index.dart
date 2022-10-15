import 'package:flutter/material.dart';
import 'package:shopping_app/common/data/app_options.dart';
import 'package:shopping_app/common/my_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Map<String, dynamic>> _menuList = [
    {"icon": MenuIcons.chaoShi, "title": '超市', "color": Colors.black},
    {
      "icon": MenuIcons.dianqi,
      "title": '电脑',
      "color": Colors.lightBlue[700],
    },
    {
      "icon": MenuIcons.baihuo,
      "title": '百货',
      "color": Colors.yellow[700],
    },
    {
      "icon": MenuIcons.shengxian,
      "title": '生鲜',
      "color": Colors.green,
    },
    {
      "icon": MenuIcons.daojia,
      "title": '到家',
      "color": Colors.blue[200],
    },
    {
      "icon": MenuIcons.chongzhi,
      "title": '充值缴费',
      "color": Colors.blue,
    },
    {
      "icon": MenuIcons.fujinhaodian,
      "title": '附近好店',
      "color": Colors.black,
    },
    {
      "icon": MenuIcons.lingquan,
      "title": '领券',
      "color": Colors.yellow[900],
    },
    {
      "icon": MenuIcons.lingjintie,
      "title": '领津贴',
      "color": Colors.red,
    },
    {
      "icon": MenuIcons.huiyuan,
      "title": '会员',
      "color": Colors.black,
    },
  ];

  Widget renderMenuList() {
    List<Widget> list = [];
    Widget content;
    for (var item in _menuList) {
      list.add(Container(
        width: 65,
        height: 50,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Icon(
                item['icon'],
                color: item['color'],
              ),
            ),
            Text(
              item['title'],
              style: const TextStyle(color: Color(0xFF666666)),
            )
          ],
        ),
      ));
    }
    content = Wrap(spacing: 4.0, runSpacing: 10.0, children: list);
    return content;
  }

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            options.theme,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // 顶部
          Container(
            height: 30,
          ),
          // 搜索框
          Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const <Widget>[
                      Icon(Icons.search),
                      Text(
                        "手机",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF808080)),
                      ),
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.photo_camera,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: SizedBox(
                          width: 1,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.list,
                      ),
                    ],
                  )
                ]),
          ),
          // 横向列表
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text(''),
          ),
          // 分类
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: renderMenuList(),
          )
        ],
      ),
    );
  }
}
