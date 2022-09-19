import 'package:flutter/material.dart';
import 'package:shopping_app/common/my_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Map<String, dynamic>> _menuList = [
    {"icon": MenuIcons.chaoShi, "title": '超市'},
    {"icon": MenuIcons.dianqi, "title": '电脑'},
    {"icon": MenuIcons.baihuo, "title": '百货'},
    {"icon": MenuIcons.shengxian, "title": '生鲜'},
    {"icon": MenuIcons.daojia, "title": '到家'},
    {"icon": MenuIcons.chongzhi, "title": '充值缴费'},
    {"icon": MenuIcons.fujinhaodian, "title": '附近好店'},
    {"icon": MenuIcons.lingquan, "title": '领券'},
    {"icon": MenuIcons.lingjintie, "title": '领津贴'},
    {"icon": MenuIcons.huiyuan, "title": '会员'},
  ];

  Widget renderMenuList() {
    List<Widget> list = [];
    Widget content;
    for (var item in _menuList) {
      list.add(Container(
        width: 70,
        height: 48,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Icon(item['icon']),
            ),
            Text(item['title'])
          ],
        ),
      ));
    }
    content = Wrap(spacing: 4.0, runSpacing: 10.0, children: list);
    return content;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(title: const Text('首页')),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2196F3),
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
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
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF808080)),
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
                child: Text(localizations.signIn),
              ),
              // 分类
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: renderMenuList(),
              )
            ],
          ),
        ));
  }
}
