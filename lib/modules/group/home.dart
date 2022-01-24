import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_flutter/modules/local/app_translation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final List<Item> items = [
    Item(name: 'page_shoppinglist', title: LocaleKeys.shopping_list.tr),
    Item(name: 'page_animation', title: LocaleKeys.animation.tr),
    Item(name: 'page_async_listview', title: LocaleKeys.async_listview.tr),
    Item(name: 'page_getip', title: LocaleKeys.get_ip.tr),
    Item(name: 'page_battery', title: LocaleKeys.get_battery.tr),
    Item(name: 'page_cardlist', title: LocaleKeys.card_listview.tr),
    Item(name: 'page_flutter_call_native', title: LocaleKeys.flutter_call_native.tr),
    Item(name: 'page_infinite_listview', title: LocaleKeys.flutter_infinite_listview.tr),
    Item(name: 'page_pageview', title: LocaleKeys.flutter_pageview.tr),
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('myflutter.com/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                platform.invokeMethod('pop', null);
                print("back");
              }
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.book),
              tooltip: 'Change Language',
              onPressed: () {
                var locale = Locale('en', 'US');
                if (Get.locale!.languageCode == 'zh') {
                  locale = Locale('en', 'US');
                } else {
                  locale = Locale('zh', 'CN');
                }
                //更新语言
                Get.updateLocale(locale);
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: widget.items.map((Item item) {
            return ListItem(
              item: item,
            );
          }).toList(),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Item {
  final String name;
  final String title;
  Item({required this.title, required this.name});
}

class ListItem extends StatelessWidget {
  final Item item;

  const ListItem({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed("${item.name}");
              // Navigator.of(context).pushNamed('/${item.name}');
            },
            title: Text(item.title),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          )
        ],
      ),
    );
  }
}
