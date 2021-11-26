import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/bing_image_model.dart';

class CardDetailView extends StatefulWidget {
  @override
  _CardDetailViewState createState() => _CardDetailViewState();
}

class _CardDetailViewState extends State<CardDetailView> {
  final BingImageModel model = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print('parameters = $model');
    return Scaffold(
      appBar: AppBar(
        title: Text(model.copyright ?? ""),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              model.url ?? '',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.favorite),
                  label: Text('喜欢'),
                  onPressed: () {
                    //回调参数
                    Get.back(result: {'key': model.copyright ?? "", 'result': true});
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.favorite_border),
                  label: Text('不喜欢'),
                  onPressed: () => Get.back(result: {'key': model.copyright ?? "", 'result': false}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
