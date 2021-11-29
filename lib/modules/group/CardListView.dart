import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter/models/bing_image_model.dart';
import 'package:my_flutter/routes/app_pages.dart';
import 'package:transparent_image/transparent_image.dart';

class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  List datasource = [];
  Map<String, bool> dict = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BingImageList"),
        actions: [
          IconButton(
            icon: Icon(Icons.cleaning_services),
            onPressed: () {
              PaintingBinding.instance!.imageCache!.clear();
              Get.defaultDialog(
                title: '提示',
                middleText: '清除图片缓存成功',
                textCancel: '好的',
              );
            },
          ),
        ],
      ),
      body: getBody(),
    );
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  getListView() {
    return ListView.builder(
      itemCount: datasource.length,
      itemBuilder: (context, index) => getCard(datasource[index]),
    );
  }

  getBody() {
    if (datasource.length > 0) {
      return getListView();
    } else {
      return getProgressDialog();
    }
  }

  getItemIcon(String title) {
    bool fav = dict[title] ?? false;
    return fav
        ? Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.white,
          );
  }

  getCard(BingImageModel model) {
    return GestureDetector(
      onTap: () async {
        //带参数push
        var result = await Get.toNamed(Routes.PAGE_CARD_DETAIL, arguments: model);
        print('回传参数: $result');
        if (result == null) {
          return;
        }
        String key = result['key'];
        bool value = result['result'];
        //Alert
        Get.defaultDialog(
          title: "${value ? '喜欢' : '不喜欢'}",
          middleText: "标题为${key}的图片",
          textCancel: "OK",
        );

        setState(() {
          dict[key] = value;
        });
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  FadeInImage.memoryNetwork(
                    image: model.url ?? "",
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    height: 200,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: getItemIcon(model.copyright ?? ""),
                  )
                ],
              ),
              // Spacer(),
              SizedBox(
                height: 10,
              ),
              Text(model.copyright ?? "")
            ],
          ),
        ),
      ),
    );
  }

  loadData() async {
    String stringUrl = 'https://api.asilu.com/bg/';
    var url = Uri.parse(stringUrl);
    var resp = await http.get(url);

    setState(() {
      var data = json.decode(resp.body);
      List images = data["images"];
      datasource = images.map((dynamic item) => BingImageModel.fromJson(item)).toList();
    });
  }
}
