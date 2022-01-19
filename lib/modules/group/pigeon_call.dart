import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pigeon/api_generated.dart';

class FlutterCallNative extends StatefulWidget {
  @override
  _FlutterCallNativeState createState() => _FlutterCallNativeState();
}

class _FlutterCallNativeState extends State<FlutterCallNative> {
  //从原生获取版本
  Future<String> _getVersion() async {
    final api = Api();
    final result = api.getPlatformVersion();
    print('调用getPlatformVersion = $result');
    return result;
  }

  //从原生获取对象
  Future<User> _getUser() async {
    final api = Api();
    final result = api.getUser();
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 注入 method channel
    FlutterSideApi.setup(FLTApiManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter调用原生'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: _getVersion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var value = 'Flutter调用原生获取版本: ${snapshot.data ?? '获取失败'}';
                  return new Text(value);
                } else if (snapshot.hasError) {
                  return new Text("${snapshot.error}");
                }
                // By default, show a loading spinner
                return new CircularProgressIndicator();
              },
            ),
            FutureBuilder<User>(
              future: _getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var value = 'Flutter调用原生获取Username: ${snapshot.data?.name ?? '获取失败'}';
                  return new Text(value);
                } else if (snapshot.hasError) {
                  return new Text("${snapshot.error}");
                }
                // By default, show a loading spinner
                return new CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FLTApiManager extends FlutterSideApi {
  @override
  void sessionInvaild() {
    print('====Call session invalid====');
  }

  @override
  User sendUser() {
    User _user = User();
    _user.name = 'zed';
    _user.age = 99;
    _user.sex = true;

    return _user;
  }
}
