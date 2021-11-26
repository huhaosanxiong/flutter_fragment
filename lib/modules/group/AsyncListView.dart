import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsyncListView extends StatefulWidget {
  @override
  _AsyncListViewState createState() => _AsyncListViewState();
}

class _AsyncListViewState extends State<AsyncListView> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getRow(int i) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/10816.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Row ${widgets[i]["title"]}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'subtitle',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            height: 0.5,
            indent: 0,
          )
        ],
      ),
    );
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AsyncListView"),
      ),
      body: getBody(),
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    var url = Uri.parse(dataURL);
    var response = await http.get(url);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
